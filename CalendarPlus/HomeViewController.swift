//
//  HomeViewController.swift
//  CalendarPlus
//
//  Created by Emil Persson on 2019-11-15.
//  Copyright © 2019 Project_E. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let backgroundImageView = UIImageView()
    @IBOutlet weak var viewCalendarButton: UIButton!
    @IBOutlet weak var calendarPlusTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setbackground()
        setCalendarButton()
        setTitleText()
    }
    
    //Gives the calendar button rounded corners
    //Sets the style for the calendar button
    func setCalendarButton() {
        viewCalendarButton.backgroundColor = UIColor.init(red:48/255, green: 173/255, blue: 99/255, alpha: 1)
        viewCalendarButton.layer.cornerRadius = 25.0
        viewCalendarButton.tintColor = UIColor.white
    }
    
    //Sets the title text fontstyle and color
    func setTitleText() {
        let titleTextFont = UIFont(name: "HelveticaNeue-Thin", size: 25.0)!
        calendarPlusTitle.font = titleTextFont
        calendarPlusTitle.textColor = UIColor.white
    }
    
    //Sets a background for the entire homepage view
    //change the picture later on
    func setbackground() {
        
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        backgroundImageView.image = UIImage(named: "background-wave")
        view.sendSubviewToBack(backgroundImageView)
    }
}
