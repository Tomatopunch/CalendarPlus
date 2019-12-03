//
//  HomeViewController.swift
//  CalendarPlus
//
//  Created by Emil Persson on 2019-11-15.
//  Copyright © 2019 Project_E. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var UIButtonViewCalendarButton: UIButton!
    @IBOutlet weak var UILabelCalendarTitle: UILabel!
    
    let setDesign = UIdesign.init()
    let backgroundImageView = UIImageView()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setBackground()
        setDesign.setTitleText(titleLabel: UILabelCalendarTitle)
        setDesign.setButton(button: UIButtonViewCalendarButton)
    }
    //MARK: setBackground
    //Sets a background for the entire homepage view
    func setBackground() {
        
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
