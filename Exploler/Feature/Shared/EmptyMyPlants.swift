//
//  EmptyMyPlants.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/19/24.
//

import SwiftUI

struct EmptyMyPlants: View {
    var body: some View {
        Button(action: {}) {
            VStack {
                Text("🍀")
                    .font(.tossIcon(size: 38))
                Text("주변에 발견한 식물을 기록해보세요.")
                    .font(.Pretendard.caption)
            }
            .foregroundStyle(Color.Font.subtitle)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .buttonStyle(ContentButtonStyle())
    }
}

#Preview {
    EmptyMyPlants()
}
