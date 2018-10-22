//
//  LoginPresenterTests.swift
//  AlertViewModelDemo
//
//  Created by Петрічук Олег Аркадійовіч on 22.10.2018.
//  Copyright © 2018 Oleg Petrychuk. All rights reserved.
//

import AlertViewModelDemo
import Nimble
import XCTest

class LoginPresenterTests: XCTestCase {
    var router: FakeLoginRouter!
    var view: FakeLoginPresenterOutput!
    var sut: LoginPresenterType!
    
    override func setUp() {
        super.setUp()
        router = FakeLoginRouter()
        view = FakeLoginPresenterOutput()
        sut = LoginPresenterFactory.default(router: router)
        sut.output = view
    }
    
    func testSelectNameAlert() {
        sut.loginTrigger()
        
        expect(self.router.passedAlert?.title).to(equal("Select your name"))
        expect(self.router.passedAlert?.message).to(beNil())
        expect(self.router.passedAlert?.style).to(equal(.actionSheet))
        expect(self.router.passedAlert?.kind).to(equal(.theme))
        expect(self.router.passedAlert?.actions.count).to(equal(3))
        expect(self.router.passedAlert?.actions[0].title).to(equal("Login as Alex"))
        expect(self.router.passedAlert?.actions[1].title).to(equal("Login as Jake"))
    }
    
    func testSaveUpdateName() {
        sut.loginTrigger()
        router.passedAlert?.actions[0].action?()
        expect(self.view.passedName).to(equal("Alex"))
        
        sut.loginTrigger()
        router.passedAlert?.actions[1].action?()
        expect(self.view.passedName).to(equal("Jake"))
    }
}


class FakeLoginRouter: LoginRouterType {
    var passedAlert: AlertViewModelType?
    func shouldShowAlert(_ alert: AlertViewModelType) {
        passedAlert = alert
    }
}

class FakeLoginPresenterOutput: LoginPresenterOutput {
    var passedName: String?
    func nameDidUpdate(_ name: String) {
        passedName = name
    }
}
