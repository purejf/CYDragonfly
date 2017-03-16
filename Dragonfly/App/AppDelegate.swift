//
//  AppDelegate.swift
//  Dragonfly
//
//  Created by Charles on 2017/3/16.
//  Copyright © 2017年 cy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.white
        self.window?.rootViewController = CYBaseNavigationController(rootViewController: CYRootViewController())
        self.window?.makeKeyAndVisible()
        return true
    }

}

