//
//  UIAlertController+extensions.swift
//  AlertViewModelDemoTests
//
//  Created by Петрічук Олег Аркадійовіч on 20.10.2018.
//  Copyright © 2018 Oleg Petrychuk. All rights reserved.
//

import UIKit
import AlertViewModelDemo

extension UIAlertController {
    public func tapButton(atIndex index: Int) {
        if let action = actions[safe: index], let block = action.value(forKey: "handler") {
            typealias AlertHandler = @convention(block) (UIAlertAction) -> Void
            let blockPtr = UnsafeRawPointer(Unmanaged<AnyObject>.passUnretained(block as AnyObject).toOpaque())
            let handler = unsafeBitCast(blockPtr, to: AlertHandler.self)
            handler(self.actions[index])
        }
    }
}
