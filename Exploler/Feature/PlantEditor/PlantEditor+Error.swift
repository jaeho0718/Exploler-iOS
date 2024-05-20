//
//  PlantEditor+Error.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import Foundation

enum PlantAnalyzerError: Error {
    case loadPlantLocationFailed
    case loadPlantColorFailed
    case loadPlantPhotoFailed
    case loadPlantDateFailed
}
