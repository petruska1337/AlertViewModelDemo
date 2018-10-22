//
//  AlertActionViewModelTests.swift
//  Core
//
//  Created by Oleg Petrychuk on 13.09.2018.
//  Copyright © 2018 Oleg Petrychuk. All rights reserved.
//

import AlertViewModelDemo
import Nimble
import XCTest

class AlertActionViewModelTests: XCTestCase {
    func testConstructor() {
        let title = String.random()
        let style = AlertActionStyleViewModel.cancel
        
        let sut = AlertActionViewModel.init(title: title, style: style) {}
        
        expect(sut.title).to(equal(title))
        expect(sut.style).to(equal(style))
        expect(sut.action).toNot(beNil())
    }
}
