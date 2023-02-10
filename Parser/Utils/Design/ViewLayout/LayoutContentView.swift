//
//  LayoutContentView.swift
//  SimpleApp
//
//  Created by Danylo Sluzhynskyi on 29.07.2021.
//

import UIKit

class LayoutContentView<Layout: ViewLayout>: View, LayoutView {

    // MARK: - Properties

    private(set) lazy var layout: Layout = configuredLayout()


    // MARK: - Configuration

    override func configure() {
        super.configure()

        processLayout()
    }


    // MARK: - Lifecycle

    override func layoutSubviews() {
        super.layoutSubviews()

        layout.didLayoutSubviews()
    }


    // MARK: - View
    // MARK: Layout

    func processLayout() {
        layout.process()
    }
}
