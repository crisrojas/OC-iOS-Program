//
//  AppDelegate.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 20/03/2021.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    /// Necessary on iOS11
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupTabbar()
        
        let attrs = [
            NSAttributedString.Key.foregroundColor: UIColor.darkPurple,
            NSAttributedString.Key.font: UIFont.textBiggest
        ]

            UINavigationBar.appearance().titleTextAttributes = attrs
        
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

// MARK: - App UI
private extension AppDelegate {
    func setupTabbar() {
        let appearance = UITabBar.appearance()
        
        
        appearance.backgroundColor = .cream
    
        appearance.shadowImage =  UIImage()
        appearance.backgroundImage = UIImage()
        
        let tintColor = UIColor.darkPurple
        
        appearance.unselectedItemTintColor = tintColor.withAlphaComponent(0.4)
        
        let attributes = [
            NSAttributedString.Key.foregroundColor: tintColor,
        ]
        
        UITabBar.appearance().tintColor = tintColor
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
    }
}
