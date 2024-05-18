//
//  AddPlantButton.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct AddPlantButton: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Text("📷")
                Text("식물 추가하기")
            }
            .foregroundStyle(Color.Font.overlay)
        }
        .buttonStyle(PrimaryButtonStyle(color: .accent))
    }
}

#Preview {
    AddPlantButton()
}
