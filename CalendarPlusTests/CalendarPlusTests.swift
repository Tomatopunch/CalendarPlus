//
//  CalendarPlusTests.swift
//  CalendarPlusTests
//
//  Created by Dennis Andersson on 2019-11-13.
//  Copyright © 2019 Project_E. All rights reserved.
//

import XCTest
@testable import CalendarPlus
import UIKit
import SQLite

class CalendarPlusTests: XCTestCase {

    let database = Database.init()
    let eventviewcontroller = EventViewController.init()
    let event = Event.init()
    var tempNoEvents: [Event] = []

    
    
    func testDatabaseIsEmpty() {
        
        let databaseArray = database.getEvents()
        
        tempNoEvents = eventviewcontroller.createNoEventArray()

        XCTAssertEqual(tempNoEvents.count, 1) // always one for default
        XCTAssertNotNil(databaseArray, "database is not empty!")
        XCTAssertNotNil(tempNoEvents, "NoEvent array is more or less than one!")
        
    }
    
    func testCreateNoEventArray() {
        
        tempNoEvents = eventviewcontroller.createNoEventArray()
        
        XCTAssertEqual(tempNoEvents[0].eventTitle, "There are no events!")
        XCTAssertEqual(tempNoEvents[0].eventDate, "")
        XCTAssertEqual(tempNoEvents[0].eventDescription, "")
        
        let testImage = UIImage(named: "notify")
        let testImageData = testImage?.pngData()
        let arrayImage = tempNoEvents[0].eventImage
        
        XCTAssertEqual(arrayImage, testImageData)
       
    }
    
    func testWeather() {
        
        let calendarViewController = CalendarViewController.init()
        var testValue: Double = -400
        var toTextualDescriptionTest = calendarViewController.toTextualDescription(degree: testValue)
        
        XCTAssertEqual(toTextualDescriptionTest, "Degree out of boundry")
    
        testValue = 338
        toTextualDescriptionTest = calendarViewController.toTextualDescription(degree: testValue)
        
        XCTAssertEqual(toTextualDescriptionTest, "Northerly")
        
        testValue = 293
        toTextualDescriptionTest = calendarViewController.toTextualDescription(degree: testValue)
        
        XCTAssertEqual(toTextualDescriptionTest, "North Westerly")
        
        testValue = 248
        toTextualDescriptionTest = calendarViewController.toTextualDescription(degree: testValue)
        
        XCTAssertEqual(toTextualDescriptionTest, "Westerly")
        
        testValue = 203
        toTextualDescriptionTest = calendarViewController.toTextualDescription(degree: testValue)
        
        XCTAssertEqual(toTextualDescriptionTest, "South Westerly")
        
        testValue = 158
        toTextualDescriptionTest = calendarViewController.toTextualDescription(degree: testValue)
        
        XCTAssertEqual(toTextualDescriptionTest, "Southerly")
        
        testValue = 123
        toTextualDescriptionTest = calendarViewController.toTextualDescription(degree: testValue)
        
        XCTAssertEqual(toTextualDescriptionTest, "South Easterly")
        
        testValue = 68
        toTextualDescriptionTest = calendarViewController.toTextualDescription(degree: testValue)
        
        XCTAssertEqual(toTextualDescriptionTest, "Easterly")
        
        testValue = 23
        toTextualDescriptionTest = calendarViewController.toTextualDescription(degree: testValue)
        
        XCTAssertEqual(toTextualDescriptionTest, "North Easterly")
        
    }
    
    func testEventClassInit() {
        
        let image = UIImage(systemName: "person")
        
        let eventImage = image!.pngData()
        let eventDate = "2018/10/10"
        let eventTitle = "Test"
        let eventDescription = "Test description"
        let eventId = 0
        
        
        let event = Event.init(eventImage: eventImage!, eventDate: eventDate, eventTitle: eventTitle, eventDescription: eventDescription, eventId: eventId)
        
        XCTAssertEqual(eventImage, event.eventImage)
        XCTAssertEqual(eventDate, event.eventDate)
        XCTAssertEqual(eventTitle, event.eventTitle)
        XCTAssertEqual(eventDescription, event.eventDescription)
        XCTAssertEqual(eventId, event.eventId)
    }
}
