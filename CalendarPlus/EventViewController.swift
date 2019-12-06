//
//  EventViewController.swift
//  CalendarPlus
//
//  Created by Emil Persson on 2019-11-15.
//  Copyright © 2019 Project_E. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

    @IBOutlet weak var UITableViewEventTable: UITableView!

    var events: [Event] = []
    let database = Database.init()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        UITableViewEventTable.delegate = self
        UITableViewEventTable.dataSource = self
    }
    	
    @IBAction func UIButtonDelete() {
        
        viewWillAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        getAvailableEvents()
        UITableViewEventTable.reloadData()
    }
    
 
    // MARK: getAvailableEvents
    // function for checking if event array is empty so the NoEvent cell can be implemented.
    func getAvailableEvents() {
        
        if database.getEvents().count == 0 {
            events = createNoEventArray()
        }
        else {
            
            events = database.getEvents()
        }
    }
    // MARK: createNoEventArray
    //this function is for when there are no events, so it creates a static cell to display that.
    func createNoEventArray() -> [Event] {
        
        var tempNoEvents: [Event] = []
        let tempImage = UIImage(named: "notify")
        let imageData = tempImage!.pngData()
        let noEvent = Event(eventImage: imageData!, eventDate: "", eventTitle: "There are no events!", eventDescription: "", eventId: 1000000000000000)

        //appending the object to the array
        tempNoEvents.append(noEvent)

        return tempNoEvents
    }
    
    // MARK: prepareForSegue
    // preparing for a segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "MasterToDetail" {
            
            let destVC = segue.destination as! EventDetailedViewController
            
            destVC.event = sender as? Event
        }
    }
}
// MARK: Extension
extension EventViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK:TableViewFuncs
    //for how many number of cells there should be.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return events.count
    }
    
    //creates every cell using the func "setEvent".
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let event = events[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell") as! EventCell
        var hidden = false
        
        if event.eventId == 1000000000000000 {
            
            hidden = true
        }
        
        cell.setEvent(event: event, indexPath: indexPath, hidden: hidden)
        cell.delegate = self
        
        return cell
        
    }
    
    //preforming the segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let event = events[indexPath.row]
        
        performSegue(withIdentifier: "MasterToDetail", sender: event)
    }
    
}

//MARK: Extension
extension EventViewController: EventCellDelegate {
    
    func eventDelete(row: Int) {
        
        database.deleteEvent(eventId: events[row].eventId!)
    }
}
