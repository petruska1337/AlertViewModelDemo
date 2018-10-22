//
//  UIAlertControllerFactory.swift
//  Config
//
//  Created by Oleg Petrychuk on 02.08.2018.
//  Copyright © 2018 Oleg Petrychuk. All rights reserved.
//

import UIKit

public final class UIAlertControllerFactory {
    public static func alertController(fromViewModelAlert viewModel: AlertViewModelType) -> UIAlertController {
        let alertController = UIAlertController(title: viewModel.title, message: viewModel.message, preferredStyle: alertControllerStyle(fromStyle: viewModel.style))
        if viewModel.kind == .theme { alertController.view.tintColor = .blue }
        alertControllerActions(fromViewModels: viewModel.actions).forEach { alertController.addAction($0) }
        return alertController
    }

    static private func alertControllerActions(fromViewModels viewModels: [AlertActionViewModelType]) -> [UIAlertAction] {
        return viewModels.map { viewModel in
            UIAlertAction(
                title: viewModel.title,
                style: UIAlertControllerFactory.alertActionStyle(fromStyle: viewModel.style),
                handler: { _ in viewModel.action?() }
            )
        }
    }
    
    static private func alertControllerStyle(fromStyle style: AlertViewModelStyle) -> UIAlertController.Style {
        switch style {
        case .alert: return .alert
        case .actionSheet: return .actionSheet
        }
    }
    
    static private func alertActionStyle(fromStyle style: AlertActionStyleViewModel) -> UIAlertAction.Style {
        switch style {
        case .`default`: return .default
        case .destructive: return .destructive
        case .cancel: return .cancel
        }
    }
}
