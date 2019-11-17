//
//  AppDelegate.swift
//  CalendarPlus
//
//  Created by Dennis Andersson on 2019-11-13.
//  Copyright © 2019 Project_E. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setNavBarApperance()
        setTabBarApperance()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }

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
}

