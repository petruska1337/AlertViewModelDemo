//
//  LoginPresenter.swift
//  AlertViewModelDemo
//
//  Created by Петрічук Олег Аркадійовіч on 20.10.2018.
//  Copyright © 2018 Oleg Petrychuk. All rights reserved.
//

import Foundation

// MARK: - Protocol

public protocol LoginPresenterType: class {
    var output: LoginPresenterOutput? { get set }
    func loginTrigger()
}

// MARK: - Implementation

private final class LoginPresenter: LoginPresenterType {
    private var router: LoginRouterType
    weak var output: LoginPresenterOutput?
    
    init(router: LoginRouterType) {
        self.router = router
    }
    
    func loginTrigger() {
        router.shouldShowAlert(nameAlert())
    }
    
    private func nameAlert() -> AlertViewModelType {
        let alexAlertActionVM = AlertActionViewModel(title: "Login as Alex")
        let jakeAlertActionVM = AlertActionViewModel(title: "Login as Jake")
        let alert = AlertViewModel(
            title: "Select your name",
            style: .actionSheet,
            kind: .theme,
            actions: [alexAlertActionVM, jakeAlertActionVM, AlertActionViewModel.cancel()]
        )
        alexAlertActionVM.action = { [weak self] in
            self?.output?.nameDidUpdate("Alex")
        }
        jakeAlertActionVM.action = { [weak self] in
            self?.output?.nameDidUpdate("Jake")
        }
        return alert
    }
}

// MARK: - Factory

public class LoginPresenterFactory {
    public static func `default`(
        router: LoginRouterType
    ) -> LoginPresenterType {
        return LoginPresenter(router: router)
    }
}
