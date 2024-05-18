//
//  Home.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: 35) {
                HomeTitle(total: 23)
                
                NearPlantsSection()
                
                MyPlantsSection()
            }
        }
        .contentMargins(.horizontal, 18, for: .scrollContent)
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
    Home()
}
