//
//  ResumeViewModel.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 16/11/20.
//

import Foundation

class ResumeViewModel{
    var events : [Event] = []
    let eventData : EventData = EventData()
    
    func requestEvents(completion: @escaping (Result<Int, Error>) -> ()) {

        self.eventData.resquestEvent(){ (results) in
            switch results {
            case .success(let events):
                self.events = events
                completion(.success(1))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getTitle(indexPath: Int) -> String{
        return events[indexPath].title
    }
    
    func getCost(indexPath: Int) -> String{
        let cost = "R$ \(events[indexPath].price)"
        return cost
    }
    
    func getDateFormat(indexPath: Int) -> String {
        let timeInterval = TimeInterval(events[indexPath].date)
        let date = Date(timeIntervalSince1970: timeInterval)
        
        let format = DateFormatter()
        format.locale = Locale(identifier: "pt_BR")
        format.dateFormat = "dd MMMM yyyy - HH:mm"
        let formattedDate = format.string(from: date)
        
        return formattedDate
    }
    
    //MARK: DETAILS
    func getImageURL(indexPath: Int) -> String{
        return events[indexPath].image
    }
    
    func getDescription(indexPath: Int) -> String{
        return events[indexPath].description
    }
    
    func getImage(indexPath : Int, completion: @escaping (Result<Data, Error>) -> ()) {
        self.eventData.resquestImage(url: events[indexPath].image){ (results) in
            switch results {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
