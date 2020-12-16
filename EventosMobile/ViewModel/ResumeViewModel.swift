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
    
    //MARK: RESUME VIEWCONTROLLER
    func requestEvents(completion: @escaping (Result<Int, Error>) -> ()) {
        self.eventData.resquestEvent(){ (results) in
            switch results {
            case .success(let events):
                self.appendEvents(events: events)
                completion(.success(1))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func appendEvents(events: [Event]){
        for event in events{
            self.events.append(event)
        }
    }
    
    func getTitle(indexPath: Int) -> String{
        return events[indexPath].title
    }
    
    func getCost(indexPath: Int) -> String{
        let cost = events[indexPath].price.formatToMoney(withPrefix: true)
        return cost
    }
    
    func getNumberOfEvents() -> Int {
        return events.count
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
    
    //MARK: DETAILS VIEWCONTROLLER
    func getImageURL(indexPath: Int) -> String{
        return events[indexPath].image
    }
    
    func getDescription(indexPath: Int) -> String{
        return events[indexPath].description
    }
    
    func getLatitude(indexPath: Int) -> Double{
        return events[indexPath].latitude
    }
    
    func getLongitude(indexPath: Int) -> Double{
        return events[indexPath].longitude
    }
    
    //MARK: DOWNLOAD EVENT'S IMAGE
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
    
    //MARK: SHARE EVENT
    func createShareContents(indexPath : Int) -> String {
        let text = "Olá,\nVocé acaba de ser convidado(a) para o evento: \(events[indexPath].title)\n\n\(getDescription(indexPath: indexPath))\n\nData e Horário: \(getDateFormat(indexPath: indexPath))\nValor: \(getCost(indexPath: indexPath))\nLocal: http://maps.apple.com/?ll=\(getLatitude(indexPath: indexPath)),\(getLongitude(indexPath: indexPath))"
        
        return text
    }
    
    //MARK: CHECK-IN EVENT
    func checkInOnEvent(indexPath: Int, completion: @escaping (Result<Int, Error>) -> ()) {
        if let name = UserDefaults.standard.string(forKey: "userName"),
           let email = UserDefaults.standard.string(forKey: "userEmail"){
            self.eventData.postCheckIn(eventId: events[indexPath].id, name: name, email: email){ (results) in
                switch results {
                case .success(_):
                    completion(.success(1))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }
    
    //MARK: ALERT TEXTS TO CHECK-IN
    func getAlertText(value: Bool) -> [String]{
        var texts : [String] = []
        texts.append(value == true ? "Erro" : "Parado 🤚")
        texts.append(value == true ? "Estamos com problema para efetuar seu check-in. Por favor, tente mais tarde 😊" : "Você precisa se identificar na aba Configuraçōes antes de realizar check-in em eventos.")
        texts.append(value == true ? "ok" : "Entendi")
        
        return texts
    }
}
