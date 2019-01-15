//
//  AppDelegate.swift
//  AccountApp
//
//  Created by zombietux on 15/01/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var stateController: StateController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Appearance.setGlobalAppearance()
        let initialController = window?.rootViewController as! UINavigationController
        let accountsController = initialController.viewControllers.first as! AccountsViewController
        accountsController.stateController = StateController(storageController: StorageController())
        return true
    }
}


