//
//  LoginRoute.swift
//  be_in_touch
//
//  Created by Nor1 on 18.05.2023.
//

import Foundation
import UIKit

protocol LoginRoute {
    func makeLogin() -> UIViewController
}

extension LoginRoute where Self: Router {
    func makeLogin() -> UIViewController {
            let coordinator = MainCoordinator(rootTransition: EmptyTransition())
            let viewModel = LoginViewModel(coordinator: coordinator)
            let viewController = LoginVC(viewModel: viewModel)
            coordinator.root = viewController
            return viewController
        }
}

extension MainCoordinator : LoginRoute {}
