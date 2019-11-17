//
//  EventInput.swift
//  CalendarPlus
//
//  Created by Oliver Köping on 2019-11-15.
//  Copyright © 2019 Project_E. All rights reserved.
//

import Foundation
import UIKit
class EventInformation{
    var eventName: String
    var eventDescription: String
    var eventDate: String
    //var eventImage: UIImage
    
    
    init(eventName: String, eventDescription: String, eventDate: String /*eventImage: UIImage*/){
        self.eventName = eventName
        self.eventDescription = eventDescription
        self.eventDate = eventDate
        //self.eventImage = eventImage
    }
    

}
