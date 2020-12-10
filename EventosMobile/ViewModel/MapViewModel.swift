//
//  MapViewModel.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 16/11/20.
//

import Foundation
import MapKit

class MapViewModel {
    let latitude : Double
    let longitude : Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func getRegion() -> MKCoordinateRegion {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: span)
        return region
    }
    
    func getAnotation() -> MKAnnotation {
        return EventAdress(name: "Generic", coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
    }
}
