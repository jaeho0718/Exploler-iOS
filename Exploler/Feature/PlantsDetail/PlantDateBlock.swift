//
//  PlantDateBlock.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct PlantDateBlock: View {
    var date: Date
    var color: Color
    
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .foregroundStyle(color)
            HStack(spacing: 8) {
                Text("📅")
                    .font(.tossIcon(size: 20))
                Text(date, style: .date)
                    .font(.Pretendard.body)
            }
            .foregroundStyle(Color.Font.overlay)
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    PlantDateBlock(date: .now, color: .red)
}
