//
//  EmptyNearPlants.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/19/24.
//

import SwiftUI

struct EmptyNearPlants: View {
    var location: String?
    
    var body: some View {
        Button(action: {}) {
            VStack {
                Text("🪴")
                    .font(.tossIcon(size: 38))
                Text("주변에 발견된 식물이 없어요.")
                    .font(.Pretendard.caption)
                if let location {
                    Text("\(location)의 첫번째 식물을 등록해보세요!")
                        .font(.Pretendard.caption)
                        .multilineTextAlignment(.center)
                }
            }
            .foregroundStyle(Color.Font.subtitle)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .buttonStyle(ContentButtonStyle())
    }
}

#Preview {
    EmptyNearPlants(location: "흑석동")
}
