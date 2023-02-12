//
//  TableLayoutCell.swift
//  Parser
//
//  Created by Danylo Sluzhynskyi on 12.02.2023.
//

import UIKit

class TableLayoutCell<
    Layout: ViewLayout,
    CellViewModel: ViewModel
>: TableViewCell<CellViewModel>, LayoutView {

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

