//
//  EventOutput.swift
//  CalendarPlus
//
//  Created by Emil Persson on 2019-11-15.
//  Copyright © 2019 Project_E. All rights reserved.
//

import Foundation
import UIKit

//this class creates an Event object including the following below.

class Event {
    
    var eventImage: UIImage
    var eventDate: String
    var eventTitle: String
    
    init(eventImage: UIImage, eventDate: String, eventTitle: String){
        self.eventImage = eventImage
        self.eventDate = eventDate
        self.eventTitle = eventTitle
    }
}
