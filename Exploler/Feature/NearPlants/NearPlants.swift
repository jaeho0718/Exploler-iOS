//
//  NearPlants.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI
import MapKit

struct NearPlants: View {
    var mainSpace: Namespace.ID
    @State private var current: Int?
    
    var body: some View {
        FlexableScrollLayout(scrollPosition: $current) {
            NearPlantsHeader()
        } primary: {
            Map()
                .matchedGeometryEffect(
                    id: "NearPlants",
                    in: mainSpace
                )
        } content: {
            ForEach(0..<20) { _ in
                MyPlantCell()
                    .frame(height: 75)
            }
        }
        .background(Color.Theme.surface)
    }
}

#Preview {
    ContentView()
}
