//
//  EventData.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 24/11/20.
//

import Foundation

class EventData {
    
    var listEvents : [Event] = []
    
    public func resquestEvent(completion: @escaping (Result<[Event], Error>) -> ()) {
        
        guard let url = URL(string: "http://5f5a8f24d44d640016169133.mockapi.io/api/events") else {return}

        URLSession.shared.dataTask(with: url) { (data, res, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                    completion(.failure(error))
                } else {
                    if let data = data {
                        let decoder = JSONDecoder()
                        guard let Response = try? decoder.decode([Event].self, from: data)  else { return }
                        
                        for item in Response {
                            self.listEvents.append(item)
                        }
                        completion(.success(self.listEvents))
                    }
                }
            }
        }.resume()
    }
}

