//
//  EventCell.swift
//  CalendarPlus
//
//  Created by Emil Persson on 2019-11-15.
//  Copyright © 2019 Project_E. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var UIImageViewEventImage: UIImageView!
    @IBOutlet weak var UILabelEventTitle: UILabel!
    @IBOutlet weak var UIImageEventDate: UILabel!
    
    //where the cell gets initiated.
    //color scheeme rgb(48,173,99)
    func setEvent(event: Event){
        
        UIImageViewEventImage.image = event.eventImage
        UILabelEventTitle.text = event.eventTitle
        UIImageEventDate.text = event.eventDate
    }
    
}
