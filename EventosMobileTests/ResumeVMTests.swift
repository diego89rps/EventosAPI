//
//  ResumeVMTests.swift
//  EventosMobileTests
//
//  Created by Diego Ribeiro on 13/12/20.
//

import XCTest
@testable import EventosMobile

class ResumeVMTests: XCTestCase {

    //MARK: Resume view tests
    func test_appendEvents_addsEventsToEventsArray() {
        let sut = ResumeViewModel()
        let listEvents = someEvents()
        
        sut.appendEvents(events: listEvents)
        
        XCTAssertEqual(sut.getNumberOfEvents(), 2)
    }
    
    func test_getNumberOfElements_getNumberOfAnArrayElements(){
        let sut = addEventlist()
        
        let numberElements = sut.getNumberOfEvents()
        
        XCTAssertEqual(numberElements, 2)
    }
    
    func test_getTitle_getTitleOfAnArrayElement(){
        let sut = addEventlist()
        
        let title = sut.getTitle(indexPath: 1)
        
        XCTAssertEqual(title, "some title two")
    }
    
    func test_getCost_getCostOfAnArrayElement(){
        let sut = addEventlist()
        
        let cost = sut.getCost(indexPath: 0)
        
        XCTAssertEqual(cost, "R$  29,99")
    }
    
    func test_getDateFormat_getDateOfAnArrayElement(){
        let sut = addEventlist()
        
        let date = sut.getDateFormat(indexPath: 0)
        
        XCTAssertEqual(date, "20 agosto 2018 - 14:00")
    }
    
    //MARK: Details view tests
    func test_getImageURL_getURLOfAnArrayElement(){
        let sut = addEventlist()
        
        let imageURL = sut.getImageURL(indexPath: 1)
        
        XCTAssertEqual(imageURL, "someImage two")
    }
    
    func test_getDescription_getDescriptionOfAnArrayElement(){
        let sut = addEventlist()
        
        let description = sut.getDescription(indexPath: 0)
        
        XCTAssertEqual(description, "some description one")
    }
    
    func test_getLatitude_getLatitudeOfAnArrayElement(){
        let sut = addEventlist()
        
        let latitude = sut.getLatitude(indexPath: 0)
        
        XCTAssertEqual(latitude, -30.0392981)
    }
    
    func test_getLongitude_getLongitudeOfAnArrayElement(){
        let sut = addEventlist()
        
        let longitude = sut.getLongitude(indexPath: 1)
        
        XCTAssertEqual(longitude, -51.2146267)
    }
    
    //MARK: Helper
    private func someEvents() -> [Event] {
        var listEvents : [Event] = []
        
        let eventOne = Event.init(date: 1534784400, description: "some description one", image: "someImage one", longitude: -51.2146267, latitude: -30.0392981, price: 29.99, title: "some title", id: "1")
        let eventTwo = Event.init(date: 1534784400, description: "some description two", image: "someImage two", longitude: -51.2146267, latitude: -30.0392981, price: 30, title: "some title two", id: "2")
        listEvents.append(eventOne)
        listEvents.append(eventTwo)
        
        return listEvents
    }
    
    private func addEventlist() -> ResumeViewModel{
        let sut = ResumeViewModel()
        let listEvents = someEvents()
        
        sut.appendEvents(events: listEvents)
        
        return sut
    }
    
}
