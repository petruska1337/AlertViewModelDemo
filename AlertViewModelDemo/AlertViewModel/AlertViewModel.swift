//
//  AlertViewModel.swift
//  Config
//
//  Created by Oleg Petrychuk on 02.08.2018.
//  Copyright © 2018 Oleg Petrychuk. All rights reserved.
//

public enum AlertViewModelStyle {
    case alert
    case actionSheet
}

public enum AlertViewModelKind {
    case `default`
    case theme
}

public protocol AlertViewModelType {
    var title: String? { get }
    var message: String? { get }
    var style: AlertViewModelStyle { get }
    var kind: AlertViewModelKind { get }
    var actions: [AlertActionViewModelType] { get }
}

public final class AlertViewModel: AlertViewModelType {
    public let title: String?
    public let message: String?
    public let style: AlertViewModelStyle
    public let kind: AlertViewModelKind
    public let actions: [AlertActionViewModelType]
    
    public init(
        title: String? = nil,
        message: String? = nil,
        style: AlertViewModelStyle = .alert,
        kind: AlertViewModelKind = .default,
        actions: [AlertActionViewModelType] = [AlertActionViewModelType]()
    ) {
        self.title = title
        self.message = message
        self.style = style
        self.kind = kind
        self.actions = actions
    }
}

extension AlertViewModel {
    public static func error(
        title: String = "Error",
        message: String = "Something went wrong",
        action: AlertActionViewModelType = AlertActionViewModel(title: "Ok")
    ) -> AlertViewModel {
        return AlertViewModel(title: title, message: message, style: .alert, actions: [action])
    }
}
