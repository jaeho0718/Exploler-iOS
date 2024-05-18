//
//  NearPlantsViewModel.swift
//  Exploler
//
//  Created by Lee Jaeho on 5/19/24.
//

import CoreLocation
import Foundation
import SwiftData

@Observable
class NearPlantsViewModel: NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    var locationStr: String?
    var detailLocationStr: String?
    var location: CLLocation?
    var plants: [PlantModel] = []
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestWhenInUseAuthorization()
    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
    
    func stopUpdatingLocation() {
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        DispatchQueue.main.async { [weak self] in
            self?.location = location
        }
        loadLocationStr(location: location)
    }
    
    private func loadLocationStr(location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(
            location,
            completionHandler: { (result, error) in
                if let result,
                   let placemark = result.first,
                   let local = placemark.locality,
                   let subLocal = placemark.subLocality {
                    DispatchQueue.main.async { [weak self] in
                        self?.locationStr = subLocal
                        self?.detailLocationStr = "\(local) \(subLocal)"
                    }
                }
            }
        )
    }
}
