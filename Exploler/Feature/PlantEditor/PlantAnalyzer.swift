//
//  PlantEditor+ViewModel.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/18/24.
//

import Contacts
import CoreLocation
import Foundation
import PhotosUI
import SwiftUI

import UIImageColors

@Observable
class PlantImageAnalyzer {
    var selectedPhoto: PhotosPickerItem?
    var plantImgData: Data?
    var colors: UIImageColors?
    var location: CLLocation?
    var locationStr: String = ""
    var date: Date = .now
    
    func analyzePlant() async throws {
        try await loadImageData()
        try loadDateFromData()
        try loadLocationFromData()
        try await loadLocationString()
        try loadImageColors()
    }
    
    private func loadImageData() async throws {
        guard let item = selectedPhoto else { throw PlantAnalyzerError.loadPlantPhotoFailed }
        do {
            guard let data = try await item.loadTransferable(type: Data.self) else {
                throw PlantAnalyzerError.loadPlantPhotoFailed
            }
            self.plantImgData = data
        } catch {
            throw PlantAnalyzerError.loadPlantPhotoFailed
        }
    }
    
    private func loadLocationFromData() throws {
        guard let data = plantImgData else { throw PlantAnalyzerError.loadPlantPhotoFailed }
        guard let imgSource = CGImageSourceCreateWithData(data as CFData, nil),
              let imgProperties = CGImageSourceCopyPropertiesAtIndex(
                imgSource,
                0, nil
              ) as? [CFString: Any],
              let locationData = imgProperties[kCGImagePropertyGPSDictionary] as? [CFString: Any]
        else { throw PlantAnalyzerError.loadPlantLocationFailed }
        
        guard let latitude = locationData[kCGImagePropertyGPSLatitude] as? Double,
              let longitude = locationData[kCGImagePropertyGPSLongitude] as? Double
        else { throw PlantAnalyzerError.loadPlantLocationFailed }
        
        self.location = CLLocation(latitude: latitude, longitude: longitude)
    }
    
    private func loadLocationString() async throws {
        guard let location else { throw PlantAnalyzerError.loadPlantLocationFailed }
        let geocoder = CLGeocoder()
        do {
            let placemarks = try await geocoder.reverseGeocodeLocation(
                location,
                preferredLocale: nil
            )
            
            guard let placemark = placemarks.first,
                  let name = placemark.subLocality
            else { throw PlantAnalyzerError.loadPlantLocationFailed }
            self.locationStr = name
        } catch let err as PlantAnalyzerError {
            throw err
        } catch {
            throw PlantAnalyzerError.loadPlantLocationFailed
        }
    }
    
    func loadDateFromData() throws {
        guard let data = plantImgData else { throw PlantAnalyzerError.loadPlantPhotoFailed }
        guard let imageSource = CGImageSourceCreateWithData(data as CFData, nil),
              let imageProperties = CGImageSourceCopyPropertiesAtIndex(
                imageSource, 
                0,
                nil
              ) as? [CFString: Any] 
        else {
            throw PlantAnalyzerError.loadPlantDateFailed
        }
        
        guard let exifData = imageProperties[kCGImagePropertyExifDictionary] as? [CFString: Any],
              let dateString = exifData[kCGImagePropertyExifDateTimeOriginal] as? String 
        else {
            throw PlantAnalyzerError.loadPlantDateFailed
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy:MM:dd HH:mm:ss"
        guard let date = dateFormatter.date(from: dateString) else {
            throw PlantAnalyzerError.loadPlantDateFailed
        }
        self.date = date
    }
    
    private func loadImageColors() throws {
        guard let data = plantImgData else { throw PlantAnalyzerError.loadPlantPhotoFailed }
        guard let uiImage = UIImage(data: data),
              let colors = uiImage.getColors(quality: .low) else {
            throw PlantAnalyzerError.loadPlantColorFailed
        }
        self.colors = colors
    }
}
