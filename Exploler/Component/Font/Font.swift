//
//  Font.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/17/24.
//

import Foundation
import SwiftUI

extension Font {
    enum Pretendard {
        static private let pretendardBold = "Pretendard-Bold"
        static private let pretendardSemiBold = "Pretendard-SemiBold"
        
        static let headline = Font.custom(pretendardBold, size: 16, relativeTo: .headline)
        static let largeTitle = Font.custom(pretendardBold, size: 36, relativeTo: .largeTitle)
        static let title = Font.custom(pretendardBold, size: 24, relativeTo: .title)
        static let body = Font.custom(pretendardSemiBold, size: 16, relativeTo: .body)
        static let caption = Font.custom(pretendardSemiBold, size: 12, relativeTo: .caption)
    }
}

extension Font {
    static func tossIcon(size: CGFloat) -> Font {
        return .custom("TossFaceFontMac.ttf", size: size)
    }
}
