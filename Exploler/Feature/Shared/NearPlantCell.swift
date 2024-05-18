//
//  NearPlantCell.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct NearPlantCell: View {
    
    var body: some View {
        Button(action: {}) {
            HStack(spacing: 15) {
                Text("\(String(1)).")
                    .font(.Pretendard.body)
                VStack(alignment: .leading, spacing: 4) {
                    Text("개나리")
                        .font(.Pretendard.body)
                        .foregroundStyle(.primary)
                    HStack(spacing: 2) {
                        Text("📷")
                            .font(.tossIcon(size: 12))
                        HStack(spacing: 1) {
                            Text(String(12))
                            Text("건 관찰됨")
                        }
                        .font(.Pretendard.caption)
                    }
                    .foregroundStyle(.secondary)
                }
            }
            .foregroundStyle(Color.Font.title)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        }
        .buttonStyle(ContentButtonStyle())
    }
}

#Preview {
    NearPlantsSection()
}
