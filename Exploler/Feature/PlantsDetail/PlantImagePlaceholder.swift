//
//  PlantImagePlaceholder.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/19/24.
//

import SwiftUI

struct PlantImagePlaceholder: View {
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(Color.Chip.plant)
            VStack(spacing: 15) {
                Text("📷")
                    .font(.tossIcon(size: 24))
                Text("식물이미지 불러오는중이에요.")
                    .font(.Pretendard.caption)
                    .foregroundStyle(Color.Font.overlay)
            }
        }
    }
}

#Preview {
    PlantImagePlaceholder()
}
