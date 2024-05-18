//
//  MyPlantHeader.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct MyPlantsHeader: View {
    @Environment(PageViewModel.self) private var page
    
    var body: some View {
        HStack {
            HStack(spacing: 5) {
                Text("🍀")
                    .font(.tossIcon(size: 24))
                Text("내가 찾은 식물")
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
    MyPlantsHeader()
        .environment(PageViewModel())
}
