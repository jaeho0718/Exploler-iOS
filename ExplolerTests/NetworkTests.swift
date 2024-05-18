//
//  NetworkTests.swift
//  ExplolerTests
//
//  Created by Lee Jaeho on 5/19/24.
//

import XCTest

@testable import Exploler

final class NetworkTests: XCTestCase {
    var loader: PlantLoader!
    
    override func setUpWithError() throws {
        loader = PlantLoader()
    }
    
    func testFetchAllPlants() async throws {
        let models = try await loader.fetchAllPlants()
        print(models)
        XCTAssert(models.count > 0)
    }
}
