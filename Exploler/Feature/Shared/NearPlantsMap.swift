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
            ForEach(nearPlants.plants) { plant in
                Annotation(
                    plant.name,
                    coordinate: .init(
                        latitude: plant.location.latitude,
                        longitude: plant.location.longitude
                    )
                ) {
                    ZStack {
                        Circle()
                            .foregroundStyle(Color.Theme.surface)
                            .overlay { Circle().stroke().foregroundStyle(Color.Chip.plant) }
                            .overlay {
                                Text("🌹")
                                    .font(.tossIcon(size: 16))
                            }
                        if let urlStr = plant.imageURL,
                           let url = URL(string: urlStr) {
                            AsyncImage(url: url) { phase in
                                phase.image?
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(Circle())
                            }
                        }
                    }
                    .frame(width: 35, height: 35)
                }
            }
        }
    }
}

#Preview {
    NearPlantsMap(interactiveMode: .all)
        .environment(NearPlantsViewModel())
}
