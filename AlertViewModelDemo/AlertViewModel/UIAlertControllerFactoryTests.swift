//
//  UIAlertControllerFactoryTests.swift
//  Core
//
//  Created by Oleg Petrychuk on 13.09.2018.
//  Copyright © 2018 Oleg Petrychuk. All rights reserved.
//

import AlertViewModelDemo
import Nimble
import XCTest
import UIKit

class UIAlertControllerFactoryTests: XCTestCase {
    func testConstructor() {
        let alertAction1 = AlertActionViewModel(title: String.random(), style: .cancel)
        let alertAction2 = AlertActionViewModel(title: String.random(), style: .destructive)
        let vm = AlertViewModel(
            title: String.random(),
            message: String.random(),
            style: AlertViewModelStyle.actionSheet,
            kind: .theme,
            actions: [alertAction1, alertAction2]
        )
        
        let alert = UIAlertControllerFactory.alertController(fromViewModelAlert: vm)
        
        expect(alert.title).to(equal(vm.title))
        expect(alert.message).to(equal(vm.message))
        expect(alert.preferredStyle).to(equal(.actionSheet))
        expect(alert.actions.count).to(equal(vm.actions.count))
        expect(alert.actions.first?.title).to(equal(vm.actions.first?.title))
        expect(alert.actions.first?.style).to(equal(.cancel))
        expect(alert.actions.last?.title).to(equal(vm.actions.last?.title))
        expect(alert.actions.last?.style).to(equal(.destructive))
        expect(alert.view.tintColor).to(equal(.blue))
    }
    
    func testAlertButtonTap() {
        var actionCalled = false
        let alertAction = AlertActionViewModel(title: "") {
            actionCalled = true
        }
        
        let alert = UIAlertControllerFactory.alertController(fromViewModelAlert: AlertViewModel(actions: [alertAction]))
        alert.tapButton(atIndex: 0)

        expect(actionCalled).to(beTruthy())
    }
}
