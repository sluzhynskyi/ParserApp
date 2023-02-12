//
//  PageCellLayout.swift
//  Parser
//
//  Created by Danylo Sluzhynskyi on 12.02.2023.
//

import UIKit

struct PageCellLayout: ViewLayout {

    // MARK: - Properties

    unowned let root: PageCell


    // MARK: - Appearance

    func process() {
        [root.containerView].forEach(root.contentView.addSubview(_:))
        [root.titleLabel, root.detailsLabel].forEach(root.containerView.addSubview(_:))


        let constraints = [
            root.containerView.topAnchor.constraint(equalTo: root.contentView.topAnchor, constant: 4),
            root.containerView.leadingAnchor.constraint(equalTo: root.contentView.leadingAnchor),
            root.containerView.trailingAnchor.constraint(equalTo: root.contentView.trailingAnchor),
            root.containerView.bottomAnchor.constraint(equalTo: root.contentView.bottomAnchor, constant: -4),

            root.titleLabel.topAnchor.constraint(equalTo: root.containerView.topAnchor, constant: 12),
            root.titleLabel.leadingAnchor.constraint(equalTo: root.containerView.leadingAnchor, constant: 20),
            root.titleLabel.trailingAnchor.constraint(equalTo: root.containerView.trailingAnchor, constant: -10),

            root.detailsLabel.topAnchor.constraint(equalTo: root.titleLabel.bottomAnchor, constant: 12),
            root.detailsLabel.leadingAnchor.constraint(equalTo: root.containerView.leadingAnchor, constant: 20),
            root.detailsLabel.trailingAnchor.constraint(equalTo: root.containerView.trailingAnchor, constant: -20),
            root.detailsLabel.bottomAnchor.constraint(lessThanOrEqualTo: root.containerView.bottomAnchor, constant: -10)
        ]

        NSLayoutConstraint.activate(constraints)
    }
}
