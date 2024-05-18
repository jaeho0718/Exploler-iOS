//
//  ChipLayout.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct ChipLayout<Content: View>: View {
    @ViewBuilder private var content: ()->Content
    private var color: Color
    
    init(
        color: Color,
        content: @escaping () -> Content)
    {
        self.color = color
        self.content = content
    }
    
    var body: some View {
        content()
            .font(.Pretendard.body)
            .foregroundStyle(Color.Font.overlay)
            .frame(height: 35)
            .padding(EdgeInsets(top: 2, leading: 15, bottom: 2, trailing: 15))
            .background(color, in: Capsule())
    }
}
