//
//  PlantLocationBlock.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct PlantLocationBlock: View {
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundStyle(.red)
            HStack(spacing: 8) {
                Text("📍")
                    .font(.tossIcon(size: 20))
                Text("서울시 흑석동")
                    .font(.Pretendard.body)
            }
            .foregroundStyle(Color.Font.overlay)
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    PlantLocationBlock()
}