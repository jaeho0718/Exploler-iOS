//
//  PlantModel.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import Foundation
import SwiftData

@Model
class PlantModel: Codable {
    
    enum CodingKeys: CodingKey {
        case id, name, imageUrl, location, latitude, longitude, description, createdAt
    }
    
    var plantID: String
    var createdAt: Date
    var name: String
    var infomation: String
    var location: Location
    var locationStr: String
    var imageData: Data?
    var imageURL: String?
    
    struct Location: Codable {
        var latitude: Double = 0
        var longitude: Double = 0
    }
    
    init(
        plantID: String = "",
        createdAt: Date = .now,
        name: String = "",
        infomation: String = "",
        location: Location = Location(),
        locationStr: String = "",
        imageData: Data? = nil,
        imageURL: String? = nil
    ) {
        self.plantID = plantID
        self.createdAt = createdAt
        self.name = name
        self.infomation = infomation
        self.location = location
        self.locationStr = locationStr
        self.imageData = imageData
        self.imageURL = imageURL
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        plantID = try container.decode(String.self, forKey: .id)
        let createDateStr = try container.decode(String.self, forKey: .createdAt)
        guard let createDate = DateFormatter.serverTimeFormat.date(from: createDateStr) else {
            throw DecodingError.typeMismatch(
                Date.self,
                .init(
                    codingPath: [CodingKeys.createdAt],
                    debugDescription: "DateFormat(\(createDateStr))이 맞지 않습니다."
                )
            )
        }
        createdAt = createDate
        name = try container.decode(String.self, forKey: .name)
        infomation = try container.decode(String.self, forKey: .description)
        guard let latitude = Double(try container.decode(String.self, forKey: .latitude)),
              let longitude = Double(try container.decode(String.self, forKey: .longitude)) else {
            throw DecodingError.valueNotFound(
                Double.self,
                .init(codingPath: [CodingKeys.latitude, CodingKeys.longitude],
                      debugDescription: "경도 혹은 고도값을 불러올 수 없습니다.")
            )
        }
        location = Location(latitude: latitude, longitude: longitude)
        locationStr = try container.decode(String.self, forKey: .location)
        imageURL = try container.decode(String.self, forKey: .imageUrl)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(infomation, forKey: .description)
        try container.encode(locationStr, forKey: .location)
        try container.encode(String(location.latitude), forKey: .latitude)
        try container.encode(String(location.longitude), forKey: .longitude)
        try container.encode(imageURL ?? "", forKey: .imageUrl)
    }
}

fileprivate extension DateFormatter {
    static var serverTimeFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
}
