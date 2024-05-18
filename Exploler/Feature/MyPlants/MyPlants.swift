//
//  MyPlants.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI
import MapKit

struct MyPlants: View {
    @State private var current: Int?
    
    var body: some View {
        FlexableScrollLayout(scrollPosition: $current) {
            MyPlantsHeader()
        } primary: {
            Map()
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