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
            case .plantDetail(let id):
                Text(id.uuidString)
            case .plantEditor:
                PlantEditor()
                    .presentationDetents([.fraction(0.7)])
                    .presentationCornerRadius(15)
            }
        }
        .environment(page)
        .environment(sheet)
    }
}

#Preview {
    ContentView()
}
