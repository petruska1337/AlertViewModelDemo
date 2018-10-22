//
//  Bundle+extensions.swift
//  AlertViewModelDemo
//
//  Created by Петрічук Олег Аркадійовіч on 20.10.2018.
//  Copyright © 2018 Oleg Petrychuk. All rights reserved.
//

import Foundation

extension Bundle {
    static func forCurrentModule() -> Bundle {
        class TestClass {}
        return Bundle(for: TestClass.self)
    }
}
