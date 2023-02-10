//
//  AppDelegate.swift
//  Parser
//
//  Created by Danylo Sluzhynskyi on 09.02.2023.
//

import UIKit

let App = UIApplication.shared.delegate as! Application

@main
final class Application: UIResponder, UIApplicationDelegate {

        // MARK: - Properties
        // MARK: Navigation

    var window: UIWindow?

    private let appCoordinator = AppCoordinator()

        // MARK: - Appearance

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        startApp()

        return true
    }

    func startApp() {
        appCoordinator.start()

        setupRoot(
            vc: appCoordinator.navigationController
        )
    }

    private func setupRoot(
        vc: UIViewController
    ) {
        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
        }

        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}
