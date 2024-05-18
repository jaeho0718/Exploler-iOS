//
//  PrimaryButtonStyle.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.Pretendard.body)
            .foregroundStyle(Color.Font.overlay)
            .frame(maxWidth: .infinity, maxHeight: 55)
            .background(
                isEnabled ?
                color.opacity(configuration.isPressed ? 0.8 : 1) : Color.Chip.unselected,
                in: RoundedRectangle(cornerRadius: 10)
            )
    }
}
