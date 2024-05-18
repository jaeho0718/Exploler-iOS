//
//  NearPlantsHeader.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct NearPlantsHeader: View {
    @Environment(PageViewModel.self) private var page
    var location: String
    
    var body: some View {
        HStack {
            HStack(spacing: 5) {
                Text("📌")
                    .font(.tossIcon(size: 24))
                Text(location)
                    .font(.Pretendard.title)
            }
            .foregroundStyle(Color.Font.title)
            Spacer()
            Button(action: {
                withAnimation {
                    page.current = nil
                }
            }) {
                Image(systemName: "xmark")
                    .font(.Pretendard.headline)
            }
            .tint(Color.Font.title)
        }
        .padding(EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 17))
    }
}

#Preview {
    NearPlantsHeader(location: "서울시 흑석동")
}
