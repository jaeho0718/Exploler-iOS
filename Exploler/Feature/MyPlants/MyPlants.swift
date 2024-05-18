//
//  MyPlants.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI
import MapKit

struct MyPlants: View {
    @Environment(NearPlantsViewModel.self) private var nearPlants
    @State private var current: Int?
    
    var body: some View {
        FlexableScrollLayout(scrollPosition: $current) {
            MyPlantsHeader()
        } primary: {
            Map()
        } content: {
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
