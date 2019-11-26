//
//  EventDetailedViewController.swift
//  CalendarPlus
//
//  Created by Emil Persson on 2019-11-17.
//  Copyright © 2019 Project_E. All rights reserved.
//

import UIKit

class EventDetailedViewController: UIViewController {

    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var eventTitleLabel: UILabel!
    @IBOutlet weak var eventDescriptionLabel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()


    }
    // MARK: setUI
    //setting the ui for the segue
    func setUI() {
        let converter = UIImage(data: event!.eventImage!)
        eventImageView.image = converter
        eventTitleLabel.text = event?.eventTitle
        eventDescriptionLabel.text = event?.eventDescription
        eventDateLabel.text = event?.eventDate
    }


    
}
