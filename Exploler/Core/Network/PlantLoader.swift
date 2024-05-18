//
//  PlantLoader.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/19/24.
//

import Foundation

class PlantLoader {
    static let shared = PlantLoader()
    
    struct PlantRecognizeResult: Codable {
        var isPlant: Bool
        var imageUrl: String
        var name: String
    }
    
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
    
    func checkIsPlant(data: Data) async throws -> PlantRecognizeResult {
        let urlComponent = getURLComponents(path: "/plant/upload")
        let url = urlComponent.url!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("multipart/form-data", forHTTPHeaderField: "content-type")
        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        let body = createMultipartFormDataBody(
            parameters: nil,
            boundary: boundary,
            data: data,
            mimeType: "image/jpeg",
            filename: "plant.jpg"
        )
        request.httpBody = body
        let (responseData, _) = try await URLSession.shared.data(for: request)
        let result = try JSONDecoder().decode(PlantRecognizeResult.self, from: responseData)
        return result
    }
    
    func createMultipartFormDataBody(
        parameters: [String: String]?,
        boundary: String, data: Data,
        mimeType: String,
        filename: String)
    -> Data {
        var body = Data()

        // Add the data field and its content
        let boundaryPrefix = "--\(boundary)\r\n"
        body.append(boundaryPrefix.data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(filename)\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: \(mimeType)\r\n\r\n".data(using: .utf8)!)
        body.append(data)
        body.append("\r\n".data(using: .utf8)!)

        // Add parameters (if any)
        if let parameters = parameters {
            for (key, value) in parameters {
                body.append(boundaryPrefix.data(using: .utf8)!)
                body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
                body.append("\(value)\r\n".data(using: .utf8)!)
            }
        }

        // Add the boundary at the end
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)

        return body
    }
}
