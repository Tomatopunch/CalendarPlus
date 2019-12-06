//
//  EventDetailedViewController.swift
//  CalendarPlus
//
//  Created by Emil Persson on 2019-11-17.
//  Copyright © 2019 Project_E. All rights reserved.
//

import UIKit

class EventDetailedViewController: UIViewController {

    @IBOutlet weak var UIImageEventImage: UIImageView!
    @IBOutlet weak var UILabelEventTitle: UILabel!
    @IBOutlet weak var UILabelEventDescription: UILabel!
    @IBOutlet weak var UILabelEventDate: UILabel!
    
    var event: Event?
    let uiDesign = UIdesign.init()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUI()
    }
    
    // MARK: setUI
    //setting the ui for the segue
    func setUI() {
        
        let converter = UIImage(data: event!.eventImage!)
        
        UIImageEventImage.image = converter
        UILabelEventTitle.text = event?.eventTitle
        UILabelEventDescription.text = event?.eventDescription
        UILabelEventDate.text = event?.eventDate
        
        uiDesign.setTitleText(titleLabel: UILabelEventTitle)
        uiDesign.setSubTitleText(titleLabel: UILabelEventDate)
        uiDesign.setSubTitleText(titleLabel: UILabelEventDescription)
    }
}
