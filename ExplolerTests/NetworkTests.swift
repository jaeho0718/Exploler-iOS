//
//  NetworkTests.swift
//  ExplolerTests
//
//  Created by Lee Jaeho on 5/19/24.
//

import XCTest

@testable import Exploler

final class NetworkTests: XCTestCase {
    var urlComponent: URLComponents!
    
    override func setUpWithError() throws {
        urlComponent = URLComponents()
        urlComponent.scheme = "http"
        urlComponent.host = "43.201.107.162"
        urlComponent.port = 8080
    }
    
    func testFetchAllPlants() async throws {
        urlComponent.path = "/plant"
        let url = urlComponent.url!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        let (data, _) = try await URLSession.shared.data(for: request)
        let models = try JSONDecoder().decode([PlantModel].self, from: data)
        print(models)
        XCTAssert(models.count > 0)
    }
}
