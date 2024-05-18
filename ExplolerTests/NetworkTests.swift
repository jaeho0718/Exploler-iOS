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
    
    func testPlantRecognition() async throws {
        let uiImage = UIImage(resource: .flowerSample)
        let data = uiImage.jpegData(compressionQuality: 0.7)!
        let result = try await loader.checkIsPlant(data: data)
        XCTAssert(result.isPlant)
    }
    
    func testPlantRegister() async throws {
        let plantModel = PlantModel(
            name: "복숭아",
            infomation: "https://flower-test-dataset.s3.ap-northeast-2.amazonaws.com/6d42b981-8bbe-4683-8279-b4b7aba45173.jpg",
            location: .init(latitude: 37.5075, longitude: 126.9609),
            locationStr: "서울시 흑석동",
            imageURL: "123"
        )
        let result = try await loader.uploadPlant(plant: plantModel)
        XCTAssert(result != nil)
    }
}
