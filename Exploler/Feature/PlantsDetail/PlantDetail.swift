//
//  PlantDetail.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct PlantDetail: View {
    @State private var extendInfo = false
    
    var body: some View {
        VStack {
            PlantImageBlock()
            FlowLayout(primary: .leading) {
                PlantInfoBlock(extend: $extendInfo)
                    .layoutPriority(1)
                if !extendInfo {
                    PlantLocationBlock()
                        .layoutPriority(1)
                    PlantDateBlock()
                        .layoutPriority(1)
                }
            }
            .frame(height: 150)
        }
        .padding(EdgeInsets(top: 5, leading: 18, bottom: 10, trailing: 15))
    }
}

#Preview {
    PlantDetail()
}
