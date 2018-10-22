//
//  LoginRouter.swift
//  AlertViewModelDemo
//
//  Created by Петрічук Олег Аркадійовіч on 20.10.2018.
//  Copyright © 2018 Oleg Petrychuk. All rights reserved.
//

import UIKit

// MARK: - Protocol

public protocol LoginRouterType {
    func shouldShowAlert(_ alert: AlertViewModelType)
}

// MARK: - Implementation

private final class LoginRouter: LoginRouterType {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func shouldShowAlert(_ alert: AlertViewModelType) {
        navigationController.present(
            UIAlertControllerFactory.alertController(fromViewModelAlert: alert),
            animated: true,
            completion: nil
        )
    }
}

// MARK: - Factory

class LoginRouterFactory {
    static func `default`(navigationController: UINavigationController) -> LoginRouterType {
        return LoginRouter(navigationController: navigationController)
    }
}

