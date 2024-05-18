//
//  PlantDetail.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct PlantDetail: View {
    @State private var extendInfo = false
    var plant: PlantModel
    
    var body: some View {
        VStack {
            PlantImageBlock(imageData: plant.imageData, imageURL: plant.imageURL)
            FlowLayout(primary: .leading) {
                PlantInfoBlock(
                    extend: $extendInfo,
                    name: plant.name,
                    infomation: plant.infomation
                )
                    .layoutPriority(1)
                if !extendInfo {
                    PlantLocationBlock(location: plant.locationStr)
                        .layoutPriority(1)
                    PlantDateBlock(date: plant.createdAt)
                        .layoutPriority(1)
                }
            }
            .frame(height: 150)
        }
        .padding(EdgeInsets(top: 5, leading: 18, bottom: 10, trailing: 15))
    }
}
