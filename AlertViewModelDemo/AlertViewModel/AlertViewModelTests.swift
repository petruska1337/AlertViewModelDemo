//
//  AlertViewModelTests.swift
//  Core
//
//  Created by Oleg Petrychuk on 13.09.2018.
//  Copyright © 2018 Oleg Petrychuk. All rights reserved.
//

import AlertViewModelDemo
import Nimble
import XCTest

class AlertViewModelTests: XCTestCase {
    func testConstructor() {
        let title = String.random()
        let style = AlertViewModelStyle.actionSheet
        let action1 = AlertActionViewModel(title: String.random())
        let action2 = AlertActionViewModel(title: String.random())
        let actions = [action1, action2]
        
        let sut = AlertViewModel(title: title, message: nil, style: style, actions: actions)
        
        expect(sut.title).to(equal(title))
        expect(sut.message).to(beNil())
        expect(sut.style).to(equal(style))
        expect(sut.actions.count).to(equal(actions.count))
        expect(sut.actions.first as? AlertActionViewModel).to(equal(action1))
        expect(sut.actions.last as? AlertActionViewModel).to(equal(action2))
    }
}
