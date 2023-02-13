//
//  PageViewControllerLayout.swift
//  Parser
//
//  Created by Danylo Sluzhynskyi on 13.02.2023.
//

import UIKit

struct PageViewControllerLayout: ViewLayout {

    // MARK: - Properties

    unowned let root: PageViewController


    // MARK: - Appearance

    func process() {
        [root.scrollView].forEach(root.view.addSubview(_:))
        [root.contentView].forEach(root.scrollView.addSubview(_:))
        [root.titleLabel, root.detailsLabel, root.firstImageView, root.secondImageView, root.thirdImageView].forEach(root.contentView.addSubview(_:))

        let constraints = [
            root.scrollView.topAnchor.constraint(equalTo: root.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            root.scrollView.centerXAnchor.constraint(equalTo: root.view.centerXAnchor),
            root.scrollView.widthAnchor.constraint(equalTo: root.view.widthAnchor),
            root.scrollView.bottomAnchor.constraint(equalTo: root.view.bottomAnchor),

            root.contentView.topAnchor.constraint(equalTo: root.scrollView.topAnchor),
            root.contentView.centerXAnchor.constraint(equalTo: root.scrollView.centerXAnchor),
            root.contentView.widthAnchor.constraint(equalTo: root.scrollView.widthAnchor),
            root.contentView.bottomAnchor.constraint(equalTo: root.scrollView.bottomAnchor),

            root.titleLabel.topAnchor.constraint(equalTo: root.contentView.topAnchor),
            root.titleLabel.leadingAnchor.constraint(equalTo: root.contentView.leadingAnchor, constant: 10),
            root.titleLabel.trailingAnchor.constraint(equalTo: root.contentView.trailingAnchor, constant: -10),

            root.detailsLabel.topAnchor.constraint(equalTo: root.titleLabel.bottomAnchor, constant: 10),
            root.detailsLabel.leadingAnchor.constraint(equalTo: root.contentView.leadingAnchor, constant: 10),
            root.detailsLabel.trailingAnchor.constraint(equalTo: root.contentView.trailingAnchor, constant: -10),

            root.firstImageView.topAnchor.constraint(equalTo: root.detailsLabel.bottomAnchor, constant: 10),
            root.firstImageView.leadingAnchor.constraint(equalTo: root.contentView.leadingAnchor, constant: 10),
            root.firstImageView.trailingAnchor.constraint(equalTo: root.contentView.trailingAnchor, constant: -10),

            root.secondImageView.topAnchor.constraint(equalTo: root.firstImageView.bottomAnchor, constant: 10),
            root.secondImageView.leadingAnchor.constraint(equalTo: root.contentView.leadingAnchor, constant: 10),
            root.secondImageView.trailingAnchor.constraint(equalTo: root.contentView.trailingAnchor, constant: -10),

            root.thirdImageView.topAnchor.constraint(equalTo: root.secondImageView.bottomAnchor, constant: 10),
            root.thirdImageView.leadingAnchor.constraint(equalTo: root.contentView.leadingAnchor, constant: 10),
            root.thirdImageView.trailingAnchor.constraint(equalTo: root.contentView.trailingAnchor, constant: -10),
            root.thirdImageView.bottomAnchor.constraint(equalTo: root.contentView.bottomAnchor)
        ]

        NSLayoutConstraint.activate(constraints)
    }

    func didLayoutSubviews() {
        [root.firstImageView, root.secondImageView, root.thirdImageView].forEach(fitHeight(of:))

    }

    private func fitHeight(of imageView: UIImageView) {
        guard let size = imageView.image?.size else {
            return
        }

        let ratio = size.width / size.height
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1/ratio).isActive = true
    }
}

