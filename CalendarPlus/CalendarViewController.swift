//
//  CalendarViewController.swift
//  CalendarPlus
//
//  Created by Dennis Andersson on 2019-11-22.
//  Copyright © 2019 Project_E. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var calendarView: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.delegate = self
        calendarView.dataSource = self
    }
    
}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    // FSCalendarDelegate
    /*
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        return "yeet"
    }
 *//*
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let dateSelected = Calendar.current.dateComponents([Calendar.Component.day, Calendar.Component.month, Calendar.Component.year], from: self.calendarView.currentPage)
        print(dateSelected)
        
        
    }
    */
  

}

