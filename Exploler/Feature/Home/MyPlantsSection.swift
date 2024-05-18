//
//  MyPlantsSection.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct MyPlantsSection: View {
    @Environment(PageViewModel.self) private var page
    var mainSpace: Namespace.ID
    
    var body: some View {
        HomeSection(
            icon: "🪴",
            header: "내가 수집한 식물",
            moreAction: {
                withAnimation {
                    page.current = .myPlants
                }
            }
        ) {
            FlowLayout(primary: .trailing) {
                MyPlantCell()
                    .layoutPriority(1)
                MyPlantCell()
                    .layoutPriority(1)
                MyPlantCell()
                    .layoutPriority(1)
                MyPlantCell()
                    .layoutPriority(0.8)
            }
            .frame(height: 200)
        }
        .matchedGeometryEffect(id: "MyPlants", in: mainSpace)
    }
}
