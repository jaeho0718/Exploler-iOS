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
        .environment(page)
    }
}

#Preview {
    ContentView()
}
