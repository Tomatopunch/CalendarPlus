//
//  EventOutput.swift
//  CalendarPlus
//
//  Created by Emil Persson on 2019-11-15.
//  Copyright © 2019 Project_E. All rights reserved.
//

import Foundation
import UIKit

//This class creates an Event object including the following below.
class Event {
    
    var eventImage: Data?
    var eventDate: String?
    var eventTitle: String?
    var eventDescription: String?
    var eventId: Int?
    
    init(eventImage: Data, eventDate: String, eventTitle: String, eventDescription: String, eventId: Int) {
        
        self.eventImage = eventImage
        self.eventDate = eventDate
        self.eventTitle = eventTitle
        self.eventDescription = eventDescription
        self.eventId = eventId
    }
    
    init(){
        
    }
}
