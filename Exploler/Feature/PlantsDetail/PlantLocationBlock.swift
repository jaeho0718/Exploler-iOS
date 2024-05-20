//
//  PlantLocationBlock.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct PlantLocationBlock: View {
    var location: String
    var color: Color
    
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundStyle(color)
            HStack(spacing: 8) {
                Text("📍")
                    .font(.tossIcon(size: 20))
                Text(location)
                    .font(.Pretendard.body)
            }
            .foregroundStyle(Color.Font.overlay)
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    PlantLocationBlock(location: "서울시 흑석동", color: .red)
}
