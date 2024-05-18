//
//  SheetViewModel.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import Foundation

enum Sheet: Identifiable {
    case plantEditor
    case plantDetail(UUID)
    
    var id: String {
        switch self {
        case .plantEditor:
            return "editor"
        case .plantDetail(let id):
            return id.uuidString
        }
    }
}

@Observable
class SheetViewModel {
    var current: Sheet?
}
