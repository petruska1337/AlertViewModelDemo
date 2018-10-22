//
//  AlertActionViewModel.swift
//  Config
//
//  Created by Oleg Petrychuk on 02.08.2018.
//  Copyright © 2018 Oleg Petrychuk. All rights reserved.
//

public enum AlertActionStyleViewModel {
    case `default`
    case destructive
    case cancel
}

public protocol AlertActionViewModelType {
    var title: String { get }
    var style: AlertActionStyleViewModel { get }
    var action: (() -> Void)? { get }
}

public final class AlertActionViewModel: AlertActionViewModelType {
    public let title: String
    public let style: AlertActionStyleViewModel
    public var action: (() -> Void)?
    
    public init(
        title: String,
        style: AlertActionStyleViewModel = .`default`,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.style = style
        self.action = action
    }
}

extension AlertActionViewModel {
    static func cancel(
        title: String = "Cancel",
        style: AlertActionStyleViewModel = .cancel,
        action: (() -> Void)? = nil
    ) -> AlertActionViewModel {
        return AlertActionViewModel(title: title, style: style, action: action)
    }
}

extension AlertActionViewModel: Equatable {
    public static func == (lhs: AlertActionViewModel, rhs: AlertActionViewModel) -> Bool {
        return lhs.title == rhs.title && lhs.style == rhs.style
    }
}
