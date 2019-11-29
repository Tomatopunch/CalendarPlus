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

    
    
    func testDatabaseIsEmpty(){
        let databaseArray = database.getEvents()
        tempNoEvents = eventviewcontroller.createNoEventArray()

        XCTAssertEqual(tempNoEvents.count, 1) // always one for default
        XCTAssertNotNil(databaseArray, "database is not empty!")
        XCTAssertNotNil(tempNoEvents, "NoEvent array is more or less than one!")
        
    }
    
    func testcreateNoEventArray(){
        tempNoEvents = eventviewcontroller.createNoEventArray()
        
        XCTAssertEqual(tempNoEvents[0].eventTitle, "There are no events!")
        
        XCTAssertEqual(tempNoEvents[0].eventDate, "")
        
        XCTAssertEqual(tempNoEvents[0].eventDescription, "")
        
        let testImage = UIImage(named: "notify")
        let testImageData = testImage?.pngData()
        
        let arrayImage = tempNoEvents[0].eventImage
        
        XCTAssertEqual(arrayImage, testImageData)
       
    }

}
