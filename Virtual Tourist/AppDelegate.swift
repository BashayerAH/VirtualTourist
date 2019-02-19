//
//  AppDelegate.swift
//  Virtual Tourist
//
//  Created by Bashayer  on 02/02/2019.
//  Copyright © 2019 Bashayer. All rights reserved.
//

import UIKit
import CoreData

    @UIApplicationMain
    class AppDelegate: UIResponder, UIApplicationDelegate {
        
        var window: UIWindow?
        
        let dataController = DataController(modelName: "Virtual_Tourist")
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Override point for customization after application launch.
            dataController.load()
            let navigationController = window?.rootViewController as! UINavigationController
            let mapVC = navigationController.topViewController as! MapViewController
            mapVC.dataController = dataController
            
            return true
        }
        
        func applicationDidEnterBackground(_ application: UIApplication) {
            saveViewContext()
        }
        
        func applicationWillTerminate(_ application: UIApplication) {
            saveViewContext()
        }
        
        func saveViewContext() {
            try? dataController.viewContext.save()
        }
        
}

