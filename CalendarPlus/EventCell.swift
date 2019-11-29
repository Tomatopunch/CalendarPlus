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

    @IBOutlet weak var UIButtonDeleteButton: UIButton!
    
    var indexPath: IndexPath!
    var delegate: EventCellDelegate?
    
    
    
    // MARK: setEvent
    //where the cell gets initiated.
    func setEvent(event: Event, indexPath: IndexPath, hidden: Bool){
        let converter = UIImage(data: event.eventImage!)
        UIImageViewEventImage.image = converter
        UILabelEventTitle.text = event.eventTitle
        UIImageEventDate.text = event.eventDate
        self.indexPath = indexPath
        UIButtonDeleteButton.isHidden = hidden
        
    }
    
    @IBAction func UIButtonDelete() {
        delegate?.eventDelete(row: indexPath.row)
        
    }
    
}

protocol EventCellDelegate {
    func eventDelete(row: Int)
    
}
