//
//  Event.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 24/11/20.
//

import Foundation

struct Event: Codable {
    let date: Int
    let description: String
    let image: String
    let longitude: Double
    let latitude: Double
    let price: Double
    let title: String
    let id: String
}
