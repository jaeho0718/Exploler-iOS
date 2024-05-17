//
//  FlowLayout.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/17/24.
//

import SwiftUI

/// 열이 2개인 FlowLayout입니다.
struct FlowLayout: Layout {
    
    enum PrimaryPosition {
        case leading, trailing
    }
    
    private var hSpace: CGFloat
    private var vSpace: CGFloat
    private var primary: PrimaryPosition
    
    init(hSpace: CGFloat = 5, vSpace: CGFloat = 5, primary: PrimaryPosition = .leading) {
        self.hSpace = hSpace
        self.vSpace = vSpace
        self.primary = primary
    }
    
    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {
        return proposal.replacingUnspecifiedDimensions()
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {
        let primarySize = getPrimaryContentSize(subviews: subviews, size: bounds.size)
        let secondaryWidth = bounds.width-hSpace-primarySize.width
        let secondaryTotalPriority = getSecondaryTotalPriority(subviews: subviews)
        let heightWithoutSpace = bounds.height-CGFloat(subviews.count-2)*vSpace
        var currentY = CGFloat.zero
        
        for (index, subview) in subviews.enumerated() {
            if primary == .leading && index == 0 {
                // leading primary
                subview.place(
                    at: bounds.origin,
                    anchor: .topLeading,
                    proposal: .init(primarySize)
                )
            } else if primary == .trailing && index == subviews.count-1 {
                // trailing primary
                subview.place(
                    at: .init(x: bounds.maxX, y: bounds.minY),
                    anchor: .topTrailing,
                    proposal: .init(primarySize)
                )
            } else if primary == .leading {
                // other
                subview.place(
                    at: .init(x: bounds.maxX, y: bounds.minY+currentY),
                    anchor: .topTrailing,
                    proposal: .init(
                        CGSize(
                            width: secondaryWidth,
                            height: heightWithoutSpace*subview.priority/secondaryTotalPriority
                        )
                    )
                )
                currentY += (heightWithoutSpace*subview.priority/secondaryTotalPriority)
                currentY += vSpace
            } else {
                // other
                subview.place(
                    at: .init(x: bounds.minX, y: bounds.minY+currentY),
                    anchor: .topLeading,
                    proposal: .init(
                        CGSize(
                            width: secondaryWidth,
                            height: heightWithoutSpace*subview.priority/secondaryTotalPriority
                        )
                    )
                )
                currentY += (heightWithoutSpace*subview.priority/secondaryTotalPriority)
                currentY += vSpace
            }
        }
    }
    
    private func getPrimaryContentSize(subviews: Subviews, size: CGSize) -> CGSize {
        var priority: Double = .zero
        if primary == .leading, let firstView = subviews.first {
            priority = firstView.priority
        } else if primary == .trailing, let lastView = subviews.last {
            priority = lastView.priority
        }
        if priority == 0 {
            priority = 1
        }
        let totalPriority: Double = subviews.count > 1 ? priority+1: priority
        let widthWithoutSpace = size.width-CGFloat(subviews.count == 1 ? 0 : 1)*hSpace
        let width = widthWithoutSpace*priority/totalPriority
        return CGSize(width: width, height: size.height)
    }
    
    private func getSecondaryTotalPriority(subviews: Subviews) -> Double {
        guard subviews.count > 1 else { return .zero }
        var totalPriority = subviews.reduce(0, { $0 + $1.priority })
        switch primary {
        case .leading:
            totalPriority -= subviews.first?.priority ?? .zero
        case .trailing:
            totalPriority -= subviews.last?.priority ?? .zero
        }
        return totalPriority
    }
}

#if DEBUG
#Preview {
    FlowLayout(primary: .leading) {
        RoundedRectangle(cornerRadius: 15)
            .foregroundStyle(Color.red)
            .layoutPriority(1.5)
        RoundedRectangle(cornerRadius: 15)
            .foregroundStyle(Color.orange)
            .layoutPriority(1)
        RoundedRectangle(cornerRadius: 15)
            .foregroundStyle(Color.green)
            .layoutPriority(1.2)
        RoundedRectangle(cornerRadius: 15)
            .foregroundStyle(Color.blue)
            .layoutPriority(1)
    }
    .frame(height: 250)
    .padding()
}
#endif
