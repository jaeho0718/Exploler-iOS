//
//  HomeSection.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct HomeSection<Content: View>: View {
    private var icon: String
    private var header: String
    @ViewBuilder private var content: ()->Content
    private var moreAction: (()->Void)?
    
    init(
        icon: String,
        header: String,
        moreAction: (()->Void)? = nil,
        content: @escaping () -> Content
    ) {
        self.icon = icon
        self.header = header
        self.content = content
        self.moreAction = moreAction
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 5) {
                Text(icon)
                    .font(.tossIcon(size: 16))
                Text(header)
                    .font(.Pretendard.headline)
                    .foregroundStyle(Color.Font.title)
                Spacer()
                if let moreAction {
                    Button(action: moreAction) {
                        Text("더보기")
                            .font(.Pretendard.caption)
                            .foregroundStyle(Color.Font.subtitle)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .frame(height: 25)
            content()
        }
    }
}

#Preview {
    HomeSection(icon: "✏️", header: "Test") {
        Rectangle()
    }
}
