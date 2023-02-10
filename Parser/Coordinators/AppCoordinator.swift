//
//  AppCoordinator.swift
//  Parser
//
//  Created by Danylo Sluzhynskyi on 10.02.2023.
//

import UIKit

final class AppCoordinator: Coordinator {

    var navigationController: UINavigationController
    var children: [Coordinator]?

    init(
        navigationController: UINavigationController = NavigationViewController()
    ) {
        navigationController.setNavigationBarHidden(
            true,
            animated: false
        )

        self.navigationController = navigationController
    }

    func start() {
        let controller = HomeController(viewModel: HomeControllerViewModel())

        setViewController(controller)
    }
}
