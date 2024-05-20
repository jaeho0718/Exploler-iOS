//
//  PlantLabelChip.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct PlantLabelChip: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Text("🪴")
                    .font(.tossIcon(size: 16))
                Text("식물")
                    .font(.Pretendard.body)
            }
            .foregroundStyle(Color.Font.overlay)
        }
        .buttonStyle(ChipButtonStyle(color: .green))
    }
}

#Preview {
    PlantLabelChip()
}
