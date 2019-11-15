//
//  EventViewController.swift
//  CalendarPlus
//
//  Created by Emil Persson on 2019-11-15.
//  Copyright © 2019 Project_E. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

    @IBOutlet weak var eventTableView: UITableView!
    
    var events: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        events = createEventArray()
        
        eventTableView.delegate = self
        eventTableView.dataSource = self
    
    }
    // function to create the array that contains Event objects.
    func createEventArray() -> [Event] {
        
        var tempEvents: [Event] = []
        
        let event1 = Event(eventImage: UIImage(systemName: "person")!, eventDate: "2019/11/12", eventTitle: "yeet")
        let event2 = Event(eventImage: UIImage(systemName: "person")!, eventDate: "2019/11/12", eventTitle: "yeet")
        
        //appending the object to the array
        tempEvents.append(event1)
        tempEvents.append(event2)
        
        return tempEvents
    }



}

extension EventViewController: UITableViewDataSource, UITableViewDelegate{
    
    //for how many number of cells there should be.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    //creates every cell using the func "setEvent".
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = events[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventCell
        
        cell.setEvent(event: event)
        
        return cell
        
    }
}
