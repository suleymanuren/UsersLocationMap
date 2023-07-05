//
//  LocationManager.swift
//  MapApp
//
//  Created by Bulut Sistem on 5.07.2023.
//
import CoreLocation
import CoreLocationUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    @Published var location: CLLocationCoordinate2D?

    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization() // Request location authorization
        manager.startUpdatingLocation() // Start receiving location updates
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.first?.coordinate else { return }
        location = currentLocation
    }
}

