//
//  AppDelegate.swift
//  fitnessApp
//
//  Created by Abduraxmon on 06/04/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        
        let vc1 = BodyPartVC()
        let vc2 = AvatarVC()
        
        let item1 = UITabBarItem()
        let item2 = UITabBarItem()
        
        item1.image = UIImage(systemName: "figure.run")
        item1.title = "Work out"
        item2.image = UIImage(systemName: "person.fill")
        item2.title = "Avatar"
        
        vc1.tabBarItem = item1
        vc2.tabBarItem = item2
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.tintColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.layer.masksToBounds = true
        tabBarController.tabBar.isTranslucent = true
        tabBarController.tabBar.barStyle = .default
        tabBarController.tabBar.layer.cornerRadius = 20
        tabBarController.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBarController.viewControllers = [vc1,vc2]
        tabBarController.modalPresentationStyle = .overFullScreen
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }

}

