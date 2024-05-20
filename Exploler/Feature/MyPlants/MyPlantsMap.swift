//
//  MyPlantsMap.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/19/24.
//

import SwiftUI
import MapKit

struct MyPlantsMap: View {
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    var plants: [PlantModel]
    
    var body: some View {
        Map(position: $position, interactionModes: .all) {
            ForEach(plants) { plant in
                Annotation(
                    plant.name,
                    coordinate: .init(
                        latitude: plant.location.latitude,
                        longitude: plant.location.longitude
                    )
                ) {
                    ZStack {
                        if let imgData = plant.imageData,
                           let compressedData = UIImage(data: imgData)?
                            .jpegData(compressionQuality: 0.6),
                           let uiImage = UIImage(data: compressedData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                        } else if let urlStr = plant.imageURL,
                           let url = URL(string: urlStr) {
                            AsyncImage(url: url) { phase in
                                phase.image?
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(Circle())
                            }
                        } else {
                            Circle()
                                .foregroundStyle(Color.Theme.surface)
                                .overlay { Circle().stroke().foregroundStyle(Color.Chip.plant) }
                                .overlay {
                                    Text("🌹")
                                        .font(.tossIcon(size: 16))
                                }
                        }
                    }
                    .frame(width: 35, height: 35)
                }
            }
        }
        .onAppear {
            if let firstPlant = plants.first {
                position = .region(.init(
                    center: .init(
                        latitude: firstPlant.location.latitude,
                        longitude: firstPlant.location.longitude
                    ),
                    latitudinalMeters: 300,
                    longitudinalMeters: 300
                ))
            }
        }
    }
}
