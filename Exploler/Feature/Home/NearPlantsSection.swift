//
//  NearPlantsSection.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI
import MapKit

struct NearPlantsSection: View {
    @Environment(NearPlantsViewModel.self) private var nearPlants
    @Environment(PageViewModel.self) private var page
    var mainSpace: Namespace.ID
    private var title: String {
        if let locationStr = nearPlants.locationStr {
            return "\(locationStr)의 식물"
        } else {
            return "위치 불러오는 중"
        }
    }
    
    var body: some View {
        HomeSection(
            icon: "📍",
            header: title,
            moreAction: {
                withAnimation {
                    page.current = .nearPlants
                }
            }
        ) {
            FlowLayout {
                NearPlantsMap(interactiveMode: .rotate)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .matchedGeometryEffect(id: "NearPlants", in: mainSpace, isSource: true)
                    .layoutPriority(1.3)
                if nearPlants.plants.isEmpty {
                    EmptyNearPlants(location: nearPlants.locationStr)
                        .layoutPriority(1)
                } else {
                    ForEach(nearPlants.plants.prefix(3)) { plant in
                        PlantCell(plant: plant, showImage: false)
                            .layoutPriority(1)
                    }
                }
            }
            .frame(height: 200)
        }         
    }
}
