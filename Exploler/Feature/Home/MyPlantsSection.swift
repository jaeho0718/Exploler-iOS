//
//  MyPlantsSection.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct MyPlantsSection: View {
    var body: some View {
        HomeSection(icon: "🪴", header: "내가 수집한 식물", moreAction: {}) {
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
    }
}

#Preview {
    MyPlantsSection()
}
