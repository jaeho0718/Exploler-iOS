//
//  Home.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct Home: View {
    @Environment(NearPlantsViewModel.self) private var nearPlants
    
    var mainSpace: Namespace.ID
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: 35) {
                HomeTitle(total: 23)
                    .scrollTransition { content, phase in
                        content
                            .opacity(phase.isIdentity ? 1 : 0)
                            .blur(radius: phase.isIdentity ? 0 : 7)
                    }
                
                if let recommend = nearPlants.recommendedPlant {
                    RecommendCell(plant: recommend)
                        .scrollTransition { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0)
                                .blur(radius: phase.isIdentity ? 0 : 7)
                        }
                }
                
                NearPlantsSection(mainSpace: mainSpace)
                    .scrollTransition { content, phase in
                        content
                            .opacity(phase.isIdentity ? 1 : 0)
                            .blur(radius: phase.isIdentity ? 0 : 7)
                    }
                
                MyPlantsSection(mainSpace: mainSpace)
                    .scrollTransition { content, phase in
                        content
                            .opacity(phase.isIdentity ? 1 : 0)
                            .blur(radius: phase.isIdentity ? 0 : 7)
                    }
            }
        }
        .contentMargins(.horizontal, 18, for: .scrollContent)
        .contentMargins(.top, 15, for: .scrollContent)
        .background(Color.Theme.surface)
        .safeAreaInset(edge: .bottom) {
            AddPlantButton()
                .padding(EdgeInsets(
                    top: 5,
                    leading: 18,
                    bottom: 5,
                    trailing: 18
                ))
                .background(Gradient(colors: [
                    Color.Theme.surface, .black
                ]).opacity(0.3))
        }
    }
}

#Preview {
    ContentView()
}
