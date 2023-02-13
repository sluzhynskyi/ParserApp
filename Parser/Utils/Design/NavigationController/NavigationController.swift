//
//  NavigationController.swift
//  SimpleApp
//
//  Created by Danylo Sluzhynskyi on 30.07.2021.
//

import UIKit

class NavigationViewController:
    UINavigationController,
    UINavigationBarDelegate,
    UIGestureRecognizerDelegate
{

    var isEnabledSwipeBack = true {
        didSet {
            interactivePopGestureRecognizer?.isEnabled = isEnabledSwipeBack
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        defaultNavigationBar()
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Back",
            style: .plain,
            target: nil,
            action: nil
        )

        super.pushViewController(viewController, animated: animated)
    }

    func defaultNavigationBar() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()

        navigationBar.tintColor = .black
        navigationBar.backgroundColor = .white
        navigationBar.barTintColor = .white
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationBar.isTranslucent = false
        appearance.backgroundColor = .white
        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }

    func clearNavigationBar() {
        navigationBar.tintColor = .black
        navigationBar.backgroundColor = .clear
        navigationBar.barTintColor = .clear
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationBar.isTranslucent = true
    }

    private lazy var fullScreenInteractivePopGestureRecognizer = UIPanGestureRecognizer()

    private func setupFullScreenInteractivePopGestureRecognizer() {
        guard let interactivePopGestureRecognizer = interactivePopGestureRecognizer,
              let targets = interactivePopGestureRecognizer.value(forKey: "targets")
        else {
            return
        }

        fullScreenInteractivePopGestureRecognizer.setValue(targets, forKey: "targets")
        fullScreenInteractivePopGestureRecognizer.delegate = self

        view.addGestureRecognizer(fullScreenInteractivePopGestureRecognizer)
    }

    // MARK: - UIGestureRecognizerDelegate -

    func gestureRecognizerShouldBegin(
        _ gestureRecognizer: UIGestureRecognizer
    ) -> Bool {
        let isSystemSwipeToBackEnabled = interactivePopGestureRecognizer?.isEnabled == true
        let isThereStackedViewControllers = viewControllers.count > 1

        return isSystemSwipeToBackEnabled && isThereStackedViewControllers
    }
}
