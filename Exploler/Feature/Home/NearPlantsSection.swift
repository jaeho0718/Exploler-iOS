//
//  NearPlantsSection.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI
import MapKit

struct NearPlantsSection: View {
    @Environment(PageViewModel.self) private var page
    var mainSpace: Namespace.ID
    
    var body: some View {
        HomeSection(
            icon: "📍",
            header: "흑석동의 식물",
            moreAction: {
                withAnimation {
                    page.current = .nearPlants
                }
            }
        ) {
            FlowLayout {
                Map()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .matchedGeometryEffect(id: "NearPlants", in: mainSpace)
                    .layoutPriority(1.3)
                NearPlantCell()
                    .layoutPriority(1)
                NearPlantCell()
                    .layoutPriority(1)
                NearPlantCell()
                    .layoutPriority(1)
            }
            .frame(height: 200)
        }
    }
}
