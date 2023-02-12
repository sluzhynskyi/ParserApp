//
//  HomeControllerLayout.swift
//  SimpleApp
//
//  Created by Danylo Sluzhynskyi on 30.07.2021.
//

import UIKit

struct HomeControllerLayout: ViewLayout {

    // MARK: - Properties

    unowned let root: HomeController

    
    // MARK: - Appearance

    func process() {
        [root.tableView].forEach(root.view.addSubview(_:))

        let constraints = [
            root.tableView.topAnchor.constraint(equalTo: root.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            root.tableView.leadingAnchor.constraint(equalTo: root.view.leadingAnchor, constant: 10),
            root.tableView.trailingAnchor.constraint(equalTo: root.view.trailingAnchor, constant: -10),
            root.tableView.bottomAnchor.constraint(equalTo: root.view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
