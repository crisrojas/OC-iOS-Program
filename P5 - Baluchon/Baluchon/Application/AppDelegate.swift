//
//  AppDelegate.swift
//  Baluchon
//
//  Created by Cristian Rojas on 19/11/2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // Needed for iOS 12 and earlier versions
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setupTabBar()
        return true
    }

    // MARK: UISceneSession Lifecycle
    @available(iOS 13, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    @available(iOS 13, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        postWillEnterForegroundNotification()
    }
    
    func postWillEnterForegroundNotification() {
        NotificationCenter.default.post(name: .willEnterForeground, object: nil)
    }
}

// MARK: - Private
private extension AppDelegate {
    func setupTabBar() {
        let appearance = UITabBar.appearance()
        
        
        appearance.backgroundColor = .azure
    
        appearance.shadowImage =  UIImage.getShadow()
        appearance.backgroundImage = UIImage()
        
        appearance.unselectedItemTintColor = UIColor.white.withAlphaComponent(0.4)
        
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ]
        
        UITabBar.appearance().tintColor = .white
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
    }
}
