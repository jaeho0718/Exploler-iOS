//
//  NearPlants.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI
import MapKit

struct NearPlants: View {
    @Environment(NearPlantsViewModel.self) private var nearPlants
    var mainSpace: Namespace.ID
    @State private var current: Int?
    
    var body: some View {
        FlexableScrollLayout(scrollPosition: $current) {
            NearPlantsHeader(location: nearPlants.detailLocationStr ?? "위치 불러오는 중")
        } primary: {
            NearPlantsMap(interactiveMode: .all)
                .matchedGeometryEffect(
                    id: "NearPlants",
                    in: mainSpace
                )
        } content: {
            if nearPlants.plants.isEmpty {
                EmptyNearPlants(location: nearPlants.locationStr)
                    .frame(height: 150)
            }
            ForEach(nearPlants.plants) { plant in
                PlantCell(plant: plant)
                    .frame(height: 75)
            }
        }
        .background(Color.Theme.surface)
    }
}

#Preview {
    ContentView()
}
