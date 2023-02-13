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
        self.navigationController = navigationController
    }

    func start() {
        let controller = HomeController(viewModel: HomeControllerViewModel(
            readService: JSONReadService(),
            parseService: JSONParseService()
        )).apply {
            $0.willShowPageAction = { [weak self] content in
                self?.willOpenPageController(content)
            }
        }

        setViewController(controller)
    }

    func willOpenPageController(_ content: ImagePage) {
        let controller = PageViewController(
            viewModel: PageViewControllerViewModel(
                content: content,
                downloadService: URLSessionDownloadService()
            )
        )

        controller.viewModel.loadContent { [weak self] in
            self?.navigationController.pushViewController(controller, animated: true)
        }
    }
}
