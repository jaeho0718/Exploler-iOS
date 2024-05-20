//
//  ExplolerApp.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/17/24.
//

import SwiftUI
import SwiftData

@main
struct ExplolerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: PlantModel.self)
    }
}
