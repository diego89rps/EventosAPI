//
//  EventAdress.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 16/11/20.
//

import MapKit
import UIKit

class EventAdress: NSObject, MKAnnotation {
    var name: String?
    var coordinate: CLLocationCoordinate2D
    
    init(name: String, coordinate: CLLocationCoordinate2D) {
        self.name = name
        self.coordinate = coordinate
    }
}
