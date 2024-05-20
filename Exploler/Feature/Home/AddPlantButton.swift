//
//  AddPlantButton.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct AddPlantButton: View {
    @Environment(SheetViewModel.self) private var sheet
    
    var body: some View {
        Button(action: { sheet.current = .plantEditor }) {
            HStack {
                Text("📷")
                Text("식물 추가하기")
            }
            .foregroundStyle(Color.Font.overlay)
        }
        .buttonStyle(PrimaryButtonStyle(color: .accent))
    }
}

#if DEBUG
#Preview {
    AddPlantButton()
        .environment(SheetViewModel())
}
#endif
