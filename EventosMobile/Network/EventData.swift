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
    
    public func resquestImage(url : String , completion: @escaping (Result<Data, Error>) -> ()) {
        DispatchQueue.main.async {
            if let data = try? Data.init(contentsOf: URL(string: url)!) {
                completion(.success(data))
            }else {
                completion(.failure(NSError() as Error))
            }
        }
    }
    
    public func postCheckIn(eventId : String, name: String, email: String, completion: @escaping (Result<CheckIn, Error>) -> ()) {
        
        guard let url = URL(string: "http://5f5a8f24d44d640016169133.mockapi.io/api/checkin") else {return}
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let newCheckIn = CheckIn(eventId: eventId, name: name, email: email)
        let jsonData = try? JSONEncoder().encode(newCheckIn)
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                } else {
                    if let data = data {
                        let decoder = JSONDecoder()
                        guard let Response = try? decoder.decode(CheckIn.self, from: data)  else { return }
                            completion(.success(Response))
                    }
                }
            }
        }.resume()
    }
}

