//
//  AppDelegate.swift
//  Kolesa
//
//  Created by tanik on 11.03.2023.
//

import UIKit
import Firebase
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        FirebaseApp.configure()
        window?.rootViewController = UINavigationController(rootViewController: AuthorizationViewController())
        
        window?.makeKeyAndVisible()
        
        return true
    }
}
