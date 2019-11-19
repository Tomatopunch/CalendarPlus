//
//  database.swift
//  CalendarPlus
//
//  Created by Emil Persson on 2019-11-19.
//  Copyright © 2019 Project_E. All rights reserved.
//

import Foundation
import SQLite

class database {
    
    var database: Connection!
    let eventsTable = Table("events")
    let id = Expression<Int>("id")
    let eventTitle = Expression<String>("eventTitle")
    let eventDescription = Expression<String>("eventDescription")
    let eventDate = Expression<String>("eventDate")
    let eventImage = Expression<Data>("eventImage")
    
    init() {
        let createTable = self.eventsTable.create(ifNotExists: true) { (table) in
            table.column(self.id, primaryKey: true)
            table.column(self.eventTitle)
            table.column(self.eventDescription)
            table.column(self.eventDate)
            table.column(self.eventImage)
        }
        
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
    
    func addEvent(eventTitle: String, eventDescription: String, eventDate: String, eventImage: Data) {
        
        let insertEvent = self.eventsTable.insert(self.eventTitle <- eventTitle, self.eventDescription <- eventDescription, self.eventDate <- eventDate, self.eventImage <- eventImage)
        
        do {
            try self.database.run(insertEvent)
        } catch {
            print(error)
        }
        
    }
    
    func getEvents() -> [Row]{
        var eventsArray: [Row] = []
        do {
            let events = try self.database.prepare(self.eventsTable)
            for event in events {
                eventsArray.append(event)
            }
        } catch {
            print(error)
        }
        return eventsArray
    }
    
    func deleteEvent(eventId: Int) {
        
        let event = self.eventsTable.filter(self.id == eventId)
        let deleteUser = event.delete()
        do {
            try self.database.run(deleteUser)
        } catch {
            print(error)
        }
        
    }
}
