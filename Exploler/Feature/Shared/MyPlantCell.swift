//
//  PlantCell.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct MyPlantCell: View {
    
    @ViewBuilder
    private var plantInfo: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text("개나리")
                .font(.Pretendard.body)
                .foregroundStyle(.primary)
            HStack(spacing: 4) {
                Text("📌")
                    .font(.tossIcon(size: 12))
                Text("서울시 흑석동")
                    .font(.Pretendard.caption)
            }
            .foregroundStyle(.secondary)
            HStack(spacing: 4) {
                Text("📅")
                    .font(.tossIcon(size: 12))
                Text("2024.05.17")
                    .font(.Pretendard.caption)
            }
            .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    var body: some View {
        Button(action: {}) {
            ViewThatFits(in: .vertical) {
                ZStack(alignment: .bottomLeading) {
                    GeometryReader { proxy in
                        Image(.flowerSample)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: proxy.size.width, height: proxy.size.height)
                            .clipped()
                    }
                    Rectangle()
                        .opacity(0.2)
                    plantInfo
                        .foregroundStyle(Color.Font.overlay)
                        .padding()
                }
                .frame(height: 200)
                HStack {
                    Image(.flowerSample)
                        .resizable(resizingMode: /*@START_MENU_TOKEN@*/.stretch/*@END_MENU_TOKEN@*/)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 55)
                        .clipped()
                    plantInfo
                        .foregroundStyle(Color.Font.title)
                }
            }
        }
        .buttonStyle(ContentButtonStyle())
    }
}
