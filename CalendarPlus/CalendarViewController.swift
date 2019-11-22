//
//  CalendarViewController.swift
//  CalendarPlus
//
//  Created by Dennis Andersson on 2019-11-22.
//  Copyright © 2019 Project_E. All rights reserved.
//

import UIKit
import FSCalendar
import SQLite

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var calendarView: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.delegate = self
        calendarView.dataSource = self
    }
    
}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource {
//
//    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
//
//        print(date)
//        let database = Database.init()
//
//        var tempEventArray: [Event] = []
//        tempEventArray = database.getEvents()
//
//        let dateString = "11 / 21 / 2019"
//        var eventDate = "not found"
//        print(dateString)
//
//        for event in tempEventArray {
//            print(event.eventDate!)
//            if dateString == event.eventDate!{
//
//                eventDate = "oliver är gay"
//               return eventDate
//            }
//            else {
//
//            }
//        }
//    return eventDate
//    }¨

    
    

    func calendar(calendar: FSCalendar!, hasEventForDate date: NSDate!) -> Bool {
        
        return true
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let dateSelected = Calendar.current.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year], from: calendar.selectedDate!)
        
//        print(dateSelected.month!, "/",dateSelected.day!,"/",dateSelected.year!)
//
//        print(dateSelected)
        
        
    }
 
    
  

}

