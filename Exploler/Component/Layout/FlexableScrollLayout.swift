//
//  FlexableScrollView.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/17/24.
//

import SwiftUI

struct FlexableScrollLayout<Header: View, Primary: View, Content: View, Current: Hashable>: View {
    @ViewBuilder private var header: ()->Header
    @ViewBuilder private var primary: ()->Primary
    @ViewBuilder private var content: ()->Content
    @Binding private var current: Current?
    private let headerHeight: CGFloat = 50
    private let minPrimaryHeight: CGFloat = 60
    
    init(
        scrollPosition: Binding<Current?>,
        header: @escaping () -> Header,
        primary: @escaping () -> Primary,
        content: @escaping () -> Content
    ) {
        self._current = scrollPosition
        self.header = header
        self.primary = primary
        self.content = content
    }
    
    var body: some View {
        VStack(spacing: 0) {
            header()
                .frame(maxWidth: .infinity, maxHeight: headerHeight)
            GeometryReader { proxy in
                let primaryHeight = (proxy.size.height-proxy.safeAreaInsets.top-headerHeight)/2
                ScrollView(.vertical) {
                    LazyVStack(alignment: .leading) {
                        GeometryReader { inner in
                            let offset = proxy.frame(in: .global).minY-inner.frame(in: .global).minY
                            let phase = (minPrimaryHeight-(primaryHeight-offset))/minPrimaryHeight
                            primary()
                                .frame(height: primaryHeight)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .offset(y: max(offset, 0))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .opacity(min(1, 1-phase))
                        }
                        .frame(height: primaryHeight)
                        
                        content()
                    }
                    .scrollTargetLayout()
                }
                .contentMargins(.horizontal, 15, for: .scrollContent)
                .scrollPosition(id: $current)
            }
        }
    }
}
