//
//  RecommendCell.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct RecommendCell: View {
    var plant: PlantModel
    private var formattedTitle: AttributedString {
        var string = AttributedString("오늘은 \(plant.name)를 찾아볼까요?")
        guard let range = string.range(of: plant.name) else { return string }
        string[range].foregroundColor = .orange
        return string
    }
    
    var body: some View {
        Button(action: {}) {
            VStack(alignment: .leading, spacing: 3) {
                Text(formattedTitle)
                    .font(.Pretendard.body)
                    .foregroundStyle(Color.Font.title)
                HStack(spacing: 3) {
                    Text("📍")
                        .font(.tossIcon(size: 12))
                    Text(plant.locationStr)
                        .font(.Pretendard.caption)
                }
                .foregroundStyle(Color.Font.subtitle)
            }
            .padding(EdgeInsets(top: 7, leading: 13, bottom: 7, trailing: 13))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .buttonStyle(ContentButtonStyle())
    }
}

#Preview {
    ContentView()
}
