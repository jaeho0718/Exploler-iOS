//
//  PlantLoader.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/19/24.
//

import Foundation

class PlantLoader {
    static let shared = PlantLoader()
    
    private func getURLComponents(path: String) -> URLComponents {
        var urlComponent = URLComponents()
        urlComponent.scheme = "http"
        urlComponent.host = "43.201.107.162"
        urlComponent.path = path
        urlComponent.port = 8080
        return urlComponent
    }
    
    func fetchAllPlants() async throws -> [PlantModel] {
        let urlComponent = getURLComponents(path: "/plant")
        let url = urlComponent.url!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        let (data, _) = try await URLSession.shared.data(for: request)
        let models = try JSONDecoder().decode([PlantModel].self, from: data)
        return models
    }
    /*
    func fetchPlantByID(plantID: String) async throws -> PlantModel {
        
    }
     */
}
