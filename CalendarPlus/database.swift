//
//  database.swift
//  CalendarPlus
//
//  Created by Emil Persson on 2019-11-19.
//  Copyright © 2019 Project_E. All rights reserved.
//

import Foundation
import SQLite

class Database {
    // MARK:InitDatabase
    // Setting up connection to database, Setting up attributes to create table
    var database: Connection!
    let eventsTable = Table("events")
    let id = Expression<Int>("id")
    let eventTitle = Expression<String>("eventTitle")
    let eventDescription = Expression<String>("eventDescription")
    let eventDate = Expression<String>("eventDate")
    let eventImage = Expression<Data>("eventImage")
    
    let events = Event.init()
    
    init() {
        //creating a variable that holds the whole table
        let createTable = self.eventsTable.create(ifNotExists: true) { (table) in
            table.column(self.id, primaryKey: true)
            table.column(self.eventTitle)
            table.column(self.eventDescription)
            table.column(self.eventDate)
            table.column(self.eventImage)
        }
        //Putting a path for database file and creating the table
         do{
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("events").appendingPathExtension("sqlite3")
            let database = try Connection(fileUrl.path)
            self.database = database
            
            try self.database.run(createTable)
                
           
           } catch {
               print(error)
           }
        
    }
    // MARK: DatabaseFunctions
    
    // Adding a new event
    func addEvent(eventTitle: String, eventDescription: String, eventDate: String, eventImage: Data) {
        
        let insertEvent = self.eventsTable.insert(self.eventTitle <- eventTitle, self.eventDescription <- eventDescription, self.eventDate <- eventDate, self.eventImage <- eventImage)
        
        do {
            try self.database.run(insertEvent)
        } catch {
            print(error)
        }
        
    }
    
    //Gets all the existing events
    func getEvents() -> [Event]{
        var tempEventsArray: [Event] = []
        do {
            let events = try self.database.prepare(self.eventsTable)
            for event in events {
                let tempEvent = Event(eventImage: event[self.eventImage], eventDate: event[self.eventDate], eventTitle: event[self.eventTitle], eventDescription: event[self.eventDescription])
                tempEventsArray.append(tempEvent)
            }
        } catch {
            print(error)
        }
        return tempEventsArray
    }
    
    //deleting a specific event
    func deleteEvent(eventId: Int) {
        
        let event = self.eventsTable.filter(self.id == eventId)
        let deleteUser = event.delete()
        do {
            try self.database.run(deleteUser)
        } catch {
            print(error)
        }
    }
    
    func listEvent() {
        do {
            let events = try self.database.prepare(self.eventsTable)
            for event in events{
                print("userId: \(event[self.id]), title: \(event[self.eventTitle]), description: \(event[self.eventDescription]), eventdate: \(event[self.eventDate]), title: \(event[self.eventImage])")
            }
        } catch {
            print(error)
        }
    }
}
