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
    @IBOutlet weak var UILabelEventDate: UILabel!
    @IBOutlet weak var UIButtonDeleteButton: UIButton!
    
    var indexPath: IndexPath!
    var delegate: EventCellDelegate?
    let uiDesign = UIdesign.init()
    
    
    // MARK: setEvent
    //where the cell gets initiated.
    func setEvent(event: Event, indexPath: IndexPath, hidden: Bool) {
        
        let converter = UIImage(data: event.eventImage!)
        
        UIImageViewEventImage.image = converter
        UILabelEventTitle.text = event.eventTitle
        UILabelEventDate.text = event.eventDate
        UIButtonDeleteButton.isHidden = hidden
        self.indexPath = indexPath
        
        setUI()
    }
    //MARK: SetUI
    //sets the UI for the view
    func setUI() {
        
        uiDesign.setTitleText(titleLabel: UILabelEventTitle)
        uiDesign.setSubTitleText(titleLabel: UILabelEventDate)
     }
    
    @IBAction func UIButtonDelete() {
        
        delegate?.eventDelete(row: indexPath.row)
    }
    
}

protocol EventCellDelegate {
    
    func eventDelete(row: Int)
}
