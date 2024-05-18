//
//  PlantImageBlock.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct PlantImageBlock: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(.flowerSample)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
            HStack {
                PlantLabelChip()
                PlantLabelChip()
            }
            .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        }
        .frame(height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    PlantImageBlock()
}
