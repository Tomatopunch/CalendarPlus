//
//  UIdesign.swift
//  CalendarPlus
//
//  Created by Dennis Andersson on 2019-11-29.
//  Copyright © 2019 Project_E. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIdesign
//Class that handles all the UI color scheme and font size for the app
class UIdesign {
    
    //Sets the tabbar apperance
     func setTabBarApperance() {
        
        let tabBarApperance = UITabBar.appearance()
        
        tabBarApperance.barTintColor = .black
        tabBarApperance.tintColor = UIColor.init(red:48/255, green: 173/255, blue: 99/255, alpha: 1)
     }
     
     //Sets the navbar apperance
     func setNavBarApperance() {
        
        let navigationBarApperance = UINavigationBar.appearance()
        
        navigationBarApperance.barTintColor = UIColor.black
        navigationBarApperance.tintColor = UIColor.init(red:48/255, green: 173/255, blue: 99/255, alpha: 1)
    }
    
    //Sets the title text fontstyle and color
    func setTitleText(titleLabel: UILabel) {
        
        let titleTextFont = UIFont(name: "HelveticaNeue-Thin", size: 25.0)!
        
        titleLabel.font = titleTextFont
        titleLabel.textColor = UIColor.init(red:48/255, green: 173/255, blue: 99/255, alpha: 1)
    }
    //Sets the subtitle test fontstyle and color
    func setSubTitleText(titleLabel: UILabel) {
        
        let titleTextFont = UIFont(name: "HelveticaNeue-Thin", size: 18.0)!
        
        titleLabel.font = titleTextFont
        titleLabel.textColor = UIColor.black
    }
    
    //Gives the calendar button rounded corners
    //Sets the style for the calendar button
    func setButton(button: UIButton) {
        
        button.backgroundColor = UIColor.init(red:48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
}
