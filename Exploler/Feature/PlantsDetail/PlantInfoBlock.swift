//
//  PlantInfoBlock.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct PlantInfoBlock: View {
    @Binding var extend: Bool
    
    var body: some View {
        ZStack(alignment: extend ? .topLeading : .center) {
            Rectangle()
                .foregroundStyle(.plant)
            VStack(alignment: .leading, spacing: 3) {
                Text("선제비 꽃")
                    .font(.Pretendard.title)
                Text("짧은 뿌리줄기가 있다. 줄기는 가늘게 여러 개가 모여나며 곧게 선다. 높이는 30~50cm 정도이다.")
                    .font(.Pretendard.body)
                    .lineLimit(3)
            }
            .foregroundStyle(Color.Font.overlay)
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .onTapGesture {
            withAnimation {
                extend.toggle()
            }
        }
    }
}

#Preview {
    PlantInfoBlock(extend: .constant(true))
}