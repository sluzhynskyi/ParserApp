//
//  TableViewCell.swift
//  Parser
//
//  Created by Danylo Sluzhynskyi on 12.02.2023.
//

import UIKit

protocol TableViewCellRepresentable: UITableViewCell, Reusable {
    associatedtype CellViewModel: ViewModel

    var viewModel: CellViewModel? { get }

    func configure(with viewModel: CellViewModel)
}

class TableViewCell<CellViewModel: ViewModel>: UITableViewCell, TableViewCellRepresentable {

    // MARK: - Properties

    private(set) var viewModel: CellViewModel?


    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        configure()
    }


    // MARK: - View lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()

        viewModel = nil
    }


    // MARK: - UI
    // MARK: Configuration

    func configure() {
        backgroundColor = .clear
    }


    // MARK: - ViewModel
    // MARK: Configuration

    func configure(with viewModel: CellViewModel) {
        self.viewModel = viewModel

        viewModel.configure()
    }
}

