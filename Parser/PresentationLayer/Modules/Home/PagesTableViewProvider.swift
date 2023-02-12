    //
    //  PagesTableViewProvider.swift
    //  Parser
    //
    //  Created by Danylo Sluzhynskyi on 12.02.2023.
    //

import UIKit

final class PagesTableViewProvider: TableViewProvider<
    UITableView,
    HomeControllerViewModel
> {

    // MARK: - Properties
    // MARK: Content

    var itemHeight: CGFloat { 80 }


    // MARK: - Configuration

    override func configureTableView() {
        tableView?.apply { tableView in
            tableView.register(PageCell.self)
        }

        super.configureTableView()
    }


    // MARK: - UITableViewDataSource

    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        viewModel.numberOfItems()
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let item = viewModel.item(at: indexPath.row)

        let cell = tableView.dequeueReusableCell(
            for: indexPath,
            with: PageCell.self
        )

        cell.configure(with: item)
        cell.selectionStyle = .none

        return cell
    }


    // MARK: - UITableViewDelegate

    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        defer {
            tableView.deselectRow(at: indexPath, animated: true)
        }

        reloadData()
    }

    override func tableView(
        _ tableView: UITableView,
        estimatedHeightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        itemHeight
    }

    override func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath
    ) -> CGFloat {
        itemHeight
    }
}

