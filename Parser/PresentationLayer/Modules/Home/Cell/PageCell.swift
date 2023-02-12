//
//  PageCell.swift
//  Parser
//
//  Created by Danylo Sluzhynskyi on 12.02.2023.
//

import UIKit

final class PageCell: TableLayoutCell<
PageCellLayout,
PageCellViewModel
> {
    // MARK: Views

    private(set) lazy var containerView = View() {
        $0.backgroundColor = ColorPalette.grey10
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 35
    }

    private(set) lazy var titleLabel = UILabel {
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = ColorPalette.black
        $0.textAlignment = .left
        $0.numberOfLines = 1
    }


    private(set) lazy var detailsLabel = UILabel {
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = ColorPalette.black
        $0.textAlignment = .left
        $0.numberOfLines = 0
    }

    // MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()

        titleLabel.text = nil
        detailsLabel.text = nil
    }


    // MARK: - ViewModel
    // MARK: Configuration

    override func configure(
        with viewModel: PageCellViewModel
    ) {
        super.configure(with: viewModel)

        titleLabel.text = viewModel.title
        detailsLabel.text = viewModel.details
    }
}

