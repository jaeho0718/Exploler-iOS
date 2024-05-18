//
//  NearPlantsMap.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/19/24.
//

import SwiftUI
import MapKit

struct NearPlantsMap: View {
    @Environment(NearPlantsViewModel.self) private var nearPlants
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    var interactiveMode: MapInteractionModes
    
    var body: some View {
        Map(position: $position, interactionModes: interactiveMode) {
            
        }
    }
}

#Preview {
    NearPlantsMap(interactiveMode: .all)
}
