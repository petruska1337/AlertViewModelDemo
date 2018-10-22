//
//  AppDelegate.swift
//  AlertViewModelDemo
//
//  Created by Петрічук Олег Аркадійовіч on 20.10.2018.
//  Copyright © 2018 Oleg Petrychuk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
    
        let navigationController = UINavigationController()
        let router = LoginRouterFactory.default(navigationController: navigationController)
        let presenter = LoginPresenterFactory.default(router: router)
        let viewController = LoginViewControllerFactory.default(presenter: presenter)
        navigationController.setViewControllers([viewController], animated: false)
        window?.rootViewController = navigationController
        
        return true
    }
}

