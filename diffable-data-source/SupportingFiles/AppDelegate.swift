//
//  AppDelegate.swift
//  diffable-data-source
//
//  Created by Josip Rezic on 31/01/2020.
//  Copyright © 2020 Josip Rezic. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    //
    // MARK: - Properties
    //
    
    var window: UIWindow?

    //
    // MARK: - Methods
    //
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let welcomeViewController = WelcomeViewController()
        let navigationController = UINavigationController(rootViewController: welcomeViewController)
        navigationController.navigationBar.barTintColor = .darkGray
        
        window = UIWindow()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

