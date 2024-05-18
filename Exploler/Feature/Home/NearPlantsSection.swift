//
//  NearPlantsSection.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI
import MapKit

struct NearPlantsSection: View {
    var body: some View {
        HomeSection(icon: "📍", header: "흑석동의 식물") {
            FlowLayout {
                Map()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
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

#Preview {
    NearPlantsSection()
}
