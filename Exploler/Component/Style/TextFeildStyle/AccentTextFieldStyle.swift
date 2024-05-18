//
//  AccentTextFieldStyle.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

extension View {
    func accentTextFieldStyle(color: Color) -> some View {
        self.modifier(AccentTextFieldStyleModifier(color: color))
    }
}

fileprivate struct AccentTextFieldStyleModifier: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(Color.Font.overlay)
            .frame(minWidth: .infinity, maxHeight: 55)
            .background(
                color,
                in: RoundedRectangle(cornerRadius: 10)
            )
    }
}
