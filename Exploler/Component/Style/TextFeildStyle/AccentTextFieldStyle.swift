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
            .padding(EdgeInsets(top: 2, leading: 10, bottom: 2, trailing: 10))
            .frame(maxWidth: .infinity, minHeight: 55, alignment: .leading)
            .background(
                color,
                in: RoundedRectangle(cornerRadius: 10)
            )
    }
}
