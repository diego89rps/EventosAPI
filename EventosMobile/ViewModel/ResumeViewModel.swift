//
//  ResumeViewModel.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 16/11/20.
//

import Foundation

struct TeachCell {
    var title: String
    var custo: Double
    var date : Int
}

class ResumeViewModel{
    var data: [TeachCell]!

    func setupCellsData() {

        data = [
            TeachCell(title: "Ganhar", custo: 2.8, date: 1534784400),
            TeachCell(title: "Economizar", custo: 9.0, date: 1534784400),
            TeachCell(title: "Investir", custo: 20.90, date: 1534784400),
            TeachCell(title: "Gastar", custo: 90, date: 1534784400)
        ]
    }
    
    func getTitle(indexPath: Int) -> String{
        return data[indexPath].title
    }
    
    func getCost(indexPath: Int) -> String{
        let cost = "R$ \(data[indexPath].custo)"
        return cost
    }
    
    func getDateFormat(indexPath: Int) -> String {
        let timeInterval = TimeInterval(data[indexPath].date)
        let date = Date(timeIntervalSince1970: timeInterval)
        
        let format = DateFormatter()
        format.locale = Locale(identifier: "pt_BR")
        format.dateFormat = "dd MMMM yyyy - HH:mm"
        let formattedDate = format.string(from: date)
        
        return formattedDate
    }
}
