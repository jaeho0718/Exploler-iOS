//
//  ChipPickerStyle.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct ChipButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.Pretendard.body)
            .foregroundStyle(Color.Font.overlay)
            .frame(height: 35)
            .padding(EdgeInsets(top: 2, leading: 15, bottom: 2, trailing: 15))
            .background(color, in: Capsule())
    }
}
