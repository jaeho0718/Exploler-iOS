//
//  ContentView.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/17/24.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var mainSpace
    @State private var page = PageViewModel()
    @State private var sheet = SheetViewModel()
    @State private var nearPlants = NearPlantsViewModel()
    
    var body: some View {
        ZStack {
            Home(mainSpace: mainSpace)
                .opacity(page.current != nil ? 0 : 1)
            switch page.current {
            case .myPlants:
                MyPlants()
                    .matchedGeometryEffect(
                        id: "MyPlants",
                        in: mainSpace
                    )
            case .nearPlants:
                NearPlants(mainSpace: mainSpace)
            case .none:
                EmptyView()
            }
        }
        .sheet(item: $sheet.current) { current in
            switch current {
            case .plantDetail(let plant):
               PlantDetail(plant: plant)
                    .presentationDetents([.height(400)])
                    .presentationDragIndicator(.visible)
                    .presentationCornerRadius(15)
            case .plantEditor:
                PlantEditor()
                    .presentationDetents([.fraction(0.7)])
                    .presentationCornerRadius(15)
            }
        }
        .environment(page)
        .environment(sheet)
        .environment(nearPlants)
        .onAppear {
            nearPlants.startUpdatingLocation()
        }
        .onDisappear {
            nearPlants.stopUpdatingLocation()
        }
    }
}

#Preview {
    ContentView()
}
