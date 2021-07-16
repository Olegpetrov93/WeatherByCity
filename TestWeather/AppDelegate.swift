//
//  AppDelegate.swift
//  TestWeather
//
//  Created by Алла Даминова on 14.07.2021.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let assemblyModuleBuilder = AssemblyModuleBuilder()
        let navigationController = UINavigationController()
        let router = Router(navigationController: navigationController, assemblyBuilder: assemblyModuleBuilder)
        router.initialViewController()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.barTintColor = .blueGrey
        navBarAppearance.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white,
             NSAttributedString.Key.font: UIFont.textStyle3,
             NSAttributedString.Key.paragraphStyle: Constans.paragraphStyle]
        navBarAppearance.isTranslucent = false
        
        return true
    }
}

