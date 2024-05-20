//
//  AnalyzeAnimation.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import SwiftUI

struct AnalyzeAnimation: View {
    private struct AnalyzeAnimationValue {
        var offset: CGSize = .zero
        var scale: CGFloat = 1
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text("🔍")
                .font(.tossIcon(size: 24))
                .keyframeAnimator(
                    initialValue: AnalyzeAnimationValue(),
                    repeating: true,
                    content: { view, phase in
                        view
                            .offset(phase.offset)
                            .scaleEffect(CGSize(width: phase.scale, height: phase.scale))
                    },
                    keyframes: { _ in
                        KeyframeTrack(\.offset) {
                            SpringKeyframe(CGSize(width: -10, height: -10), duration: 0.4)
                            SpringKeyframe(CGSize(width: 36, height: -40), duration: 0.4)
                            SpringKeyframe(CGSize(width: 0, height: 0), duration: 0.4)
                            LinearKeyframe(CGSize(width: 0, height: 0), duration: 1)
                        }
                        KeyframeTrack(\.scale) {
                            SpringKeyframe(1.2, duration: 0.4)
                            SpringKeyframe(0.7, duration: 0.4)
                            SpringKeyframe(1, duration: 0.4)
                            LinearKeyframe(1, duration: 1)
                        }
                    }
                )
                .frame(width: 35, height: 35)
            Text("이미지 분석중")
                .font(.Pretendard.caption)
                .foregroundStyle(Color.Font.overlay)
        }
    }
}

#Preview {
    AnalyzeAnimation()
}
