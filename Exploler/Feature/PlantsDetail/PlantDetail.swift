//
//  PlantDetail.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI
import UIImageColors

struct PlantDetail: View {
    @State private var extendInfo = false
    @State private var colors: UIImageColors?
    var plant: PlantModel
    
    var body: some View {
        VStack {
            PlantImageBlock(colors: $colors, imageData: plant.imageData, imageURL: plant.imageURL)
            FlowLayout(primary: .leading) {
                PlantInfoBlock(
                    extend: $extendInfo,
                    color: Color(uiColor: colors?.primary ?? .unselected),
                    name: plant.name,
                    infomation: plant.infomation
                )
                    .layoutPriority(1)
                if !extendInfo {
                    PlantLocationBlock(
                        location: plant.locationStr,
                        color: Color(uiColor: colors?.secondary ?? .unselected)
                    )
                    .layoutPriority(1)
                    PlantDateBlock(
                        date: plant.createdAt,
                        color: Color(uiColor: colors?.background ?? .unselected)
                    )
                    .layoutPriority(1)
                }
            }
            .frame(height: 150)
        }
        .padding(EdgeInsets(top: 5, leading: 18, bottom: 10, trailing: 15))
    }
}
