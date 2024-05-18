//
//  MyPlants.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftData
import SwiftUI
import MapKit

struct MyPlants: View {
    @Query(sort: [SortDescriptor(\PlantModel.createdAt)])
    private var userPlants: [PlantModel]
    @State private var current: Int?
    
    var body: some View {
        FlexableScrollLayout(scrollPosition: $current) {
            MyPlantsHeader()
        } primary: {
            MyPlantsMap(plants: userPlants)
        } content: {
            ForEach(userPlants) { plant in
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
