//
//  PageViewModel.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import Foundation

enum Page {
    case myPlants
    case nearPlants
}

@Observable
class PageViewModel {
    var current: Page?
}
