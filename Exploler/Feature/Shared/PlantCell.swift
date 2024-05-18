//
//  PlantCell.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct PlantCell: View {
    @Environment(SheetViewModel.self) private var sheet
    var plant: PlantModel
    var showImage: Bool = true
    
    @ViewBuilder
    private var plantInfo: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(plant.name)
                .font(.Pretendard.body)
                .foregroundStyle(.primary)
            HStack(spacing: 4) {
                Text("📌")
                    .font(.tossIcon(size: 12))
                Text(plant.locationStr)
                    .font(.Pretendard.caption)
            }
            .foregroundStyle(.secondary)
            HStack(spacing: 4) {
                Text("📅")
                    .font(.tossIcon(size: 12))
                Text(plant.createdAt, style: .date)
                    .font(.Pretendard.caption)
            }
            .foregroundStyle(.secondary)
        }
        .padding(showImage ? 
                 EdgeInsets() : EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var plantImage: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(Color.Chip.unselected)
            if let data = plant.imageData,
               let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else if let urlStr = plant.imageURL,
                      let url = URL(string: urlStr) {
                AsyncImage(url: url) { img in
                    img.image?.resizable().aspectRatio(contentMode: .fill)
                }
            }
        }
    }
    
    var body: some View {
        Button(action: { sheet.current = .plantDetail(plant) }) {
            ViewThatFits(in: .vertical) {
                ZStack(alignment: .bottomLeading) {
                    GeometryReader { proxy in
                        plantImage
                            .frame(width: proxy.size.width, height: 200)
                            .contentShape(Rectangle())
                            .clipped()
                    }
                    Rectangle()
                        .opacity(0.2)
                    plantInfo
                        .foregroundStyle(Color.Font.overlay)
                        .padding()
                }
                .frame(height: 200)
                .clipped()
                HStack {
                    if showImage {
                        plantImage
                            .frame(width: 55)
                            .contentShape(Rectangle())
                            .clipped()
                    }
                    plantInfo
                        .foregroundStyle(Color.Font.title)
                }
            }
        }
        .buttonStyle(ContentButtonStyle())
    }
}
