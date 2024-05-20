//
//  CellButtonStyle.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct ContentButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                Color.Theme.onSurface.opacity(configuration.isPressed ? 0.8 : 1),
                in: RoundedRectangle(cornerRadius: 10)
            )
            .opacity(configuration.isPressed ? 0.9: 1)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
