//
//  PlantEditor.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI
import PhotosUI

struct PlantEditor: View {
    @Environment(SheetViewModel.self) private var sheet
    @Environment(\.modelContext) private var modelContext
    @State private var plantAnalyzer = PlantImageAnalyzer()
    @State private var onAnalyze = false
    @State private var onSaving = false
    @State private var isError = false
    @State private var title: String = ""
    @State private var locationStr: String = ""
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    PhotosPicker(selection: $plantAnalyzer.selectedPhoto, matching: .images) {
                        ZStack {
                            Rectangle()
                                .foregroundStyle(Color.Chip.unselected)
                            if let data = plantAnalyzer.plantImgData,
                               let uiImage = UIImage(data: data) {
                                GeometryReader { proxy in
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: proxy.size.width, height: proxy.size.height)
                                }
                            } else {
                                HStack {
                                    Text("🍀")
                                        .font(.tossIcon(size: 24))
                                    Text("식물사진 불러오기")
                                        .font(.Pretendard.body)
                                        .foregroundStyle(Color.Font.overlay)
                                }
                            }
                            if onAnalyze {
                                Rectangle()
                                    .foregroundStyle(.ultraThinMaterial)
                                AnalyzeAnimation()
                            } else if isError {
                                ChipLayout(color: .red) {
                                    Text("이미지를 분석하는데 실패했어요.")
                                }
                            } else if let info = plantAnalyzer.plantInfo, !info.isPlant {
                                ChipLayout(color: Color.Button.cancel) {
                                    Text("식물이 아니에요.")
                                }
                            }
                        }
                        .frame(height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .animation(.easeInOut, value: onAnalyze)
                    }
                    .disabled(onAnalyze)
                    
                    Text(title)
                        .font(.Pretendard.body)
                        .accentTextFieldStyle(
                            color: Color(uiColor: plantAnalyzer.colors?.background ?? .unselected)
                        )
                        .animation(.easeInOut, value: plantAnalyzer.colors?.background)
                    
                    Text(plantAnalyzer.locationStr.isEmpty ? 
                         "📍위치정보를 찾을 수 없습니다."
                         : plantAnalyzer.locationStr)
                        .font(.Pretendard.body)
                        .multilineTextAlignment(.leading)
                        .accentTextFieldStyle(
                            color: Color(uiColor: plantAnalyzer.colors?.secondary ?? .unselected)
                        )
                        .animation(.easeInOut, value: plantAnalyzer.colors?.secondary)
                }
            }
            .contentMargins(.horizontal, 16, for: .scrollContent)
            .contentMargins(.top, 10, for: .scrollContent)
            HStack {
                Button(action: { sheet.current = nil }) {
                    Text("취소")
                }
                .buttonStyle(PrimaryButtonStyle(color: .Button.cancel))
                .disabled(onAnalyze || onSaving)
                Button(action: save) {
                    Text("저장")
                }
                .buttonStyle(PrimaryButtonStyle(color: .Button.save))
                .disabled(!(plantAnalyzer.plantInfo?.isPlant ?? false) || onAnalyze || onSaving)
            }
            .padding(EdgeInsets(top: 5, leading: 17, bottom: 5, trailing: 17))
        }
        .ignoresSafeArea(.keyboard)
        .overlay {
            if onSaving {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
        .interactiveDismissDisabled(onAnalyze || onSaving)
        .onChange(of: plantAnalyzer.selectedPhoto) { _, _ in
            Task {
                onAnalyze = true
                do {
                    try await plantAnalyzer.analyzePlant()
                    title = plantAnalyzer.plantInfo?.name ?? ""
                } catch {
                    isError = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                    onAnalyze = false
                }
            }
        }
    }
    
    private func save() {
        guard let info = plantAnalyzer.plantInfo,
              let location = plantAnalyzer.location else { return }
        Task {
            onSaving = true
            let temp = PlantModel(
                name: info.name,
                infomation: "",
                location: .init(
                    latitude: location.coordinate.latitude,
                    longitude: location.coordinate.longitude
                ),
                locationStr: plantAnalyzer.locationStr,
                imageURL: info.imageUrl
            )
            if let plantID = try? await PlantLoader.shared.uploadPlant(plant: temp) {
                temp.plantID = plantID
                temp.imageData = plantAnalyzer.plantImgData
                modelContext.insert(temp)
                onSaving = false
                sheet.current = nil
            } else {
                onSaving = false
            }
        }
    }
}

#Preview {
    PlantEditor()
}
