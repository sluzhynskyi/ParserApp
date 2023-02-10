//
//  Coordinator.swift
//  Parser
//
//  Created by Danylo Sluzhynskyi on 10.02.2023.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    var children: [Coordinator]? { get set }

    func start()
}

extension Coordinator {
    func push(_ vc: UIViewController, animated: Bool = true) {
        navigationController.pushViewController(vc, animated: animated)
    }

    func present(
        _ vc: UIViewController,
        animated: Bool = true,
        completion: (() -> Void)? = nil
    ) {
        navigationController.present(
            vc, animated: animated,
            completion: completion
        )
    }

    func popViewController(animated: Bool = true) {
        self.navigationController.popViewController(animated: animated)
    }

    func popToRootViewController(animated: Bool = true) {
        self.navigationController.popToRootViewController(animated: animated)
    }

    func setViewController(_ vc: UIViewController) {
        navigationController.setViewControllers([vc], animated: true)
    }
}
