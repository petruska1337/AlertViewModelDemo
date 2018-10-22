//
//  LoginViewController.swift
//  AlertViewModelDemo
//
//  Created by Петрічук Олег Аркадійовіч on 20.10.2018.
//  Copyright © 2018 Oleg Petrychuk. All rights reserved.
//

import UIKit

// MARK: - Protocol

public protocol LoginPresenterOutput: class {
    func nameDidUpdate(_ name: String)
}

// MARK: - Implementation

class LoginViewController: UIViewController {
    let presenter: LoginPresenterType
    @IBOutlet weak var nameLabel: UILabel!
    
    init(presenter: LoginPresenterType) {
        self.presenter = presenter
        super.init(nibName: LoginViewController.className, bundle: .forCurrentModule())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        presenter.loginTrigger()
    }
}

extension LoginViewController: LoginPresenterOutput {
    func nameDidUpdate(_ name: String) {
        nameLabel.text = name
    }
}

// MARK: - Factory

class LoginViewControllerFactory {
    static func `default`(presenter: LoginPresenterType) -> LoginViewController {
        let controller = LoginViewController(presenter: presenter)
        presenter.output = controller
        return controller
    }
}
