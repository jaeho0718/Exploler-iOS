//
//  HomeTitle.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct HomeTitle: View {
    var total: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("내가 찾은 식물")
                    .font(.Pretendard.title)
                Text("🍀")
                    .font(.tossIcon(size: 24))
            }
            HStack(spacing: 1) {
                Text(String(total))
                Text("건")
            }
            .font(.Pretendard.largeTitle)
        }
    }
}

#Preview {
    HomeTitle(total: 23)
}
