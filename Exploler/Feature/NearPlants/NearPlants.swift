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
            ForEach(0..<20) { _ in
                PlantCell()
                    .frame(height: 75)
            }
        }
        .background(Color.Theme.surface)
    }
}

#Preview {
    ContentView()
}
