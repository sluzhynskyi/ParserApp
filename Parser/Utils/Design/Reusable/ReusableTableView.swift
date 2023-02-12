//
//  ReusableTableView.swift
//  Parser
//
//  Created by Danylo Sluzhynskyi on 12.02.2023.
//

import UIKit

extension UITableView {

    // MARK: - Appearance

    final func register<T: UITableViewCell>(
        _ cellType: T.Type,
        tag: String? = nil
    ) where T: Reusable {
        let reuseIdentifier = tag != nil
            ? "\(cellType.reuseIdentifier)_\(tag!)"
            : cellType.reuseIdentifier

        register(
            cellType.self,
            forCellReuseIdentifier: reuseIdentifier
        )
    }

    final func register<T: UITableViewHeaderFooterView>(
        headerFooterViewType: T.Type
    ) where T: Reusable {
        register(
            headerFooterViewType.self,
            forHeaderFooterViewReuseIdentifier: headerFooterViewType.reuseIdentifier
        )
    }

    final func dequeueReusableCell<T: UITableViewCell>(
        for indexPath: IndexPath,
        with cellType: T.Type = T.self,
        tag: String? = nil
    ) -> T where T: Reusable {
        let reuseIdentifier = tag != nil
            ? "\(cellType.reuseIdentifier)_\(tag!)"
            : cellType.reuseIdentifier

        guard let cell = dequeueReusableCell(
                withIdentifier: reuseIdentifier,
                for: indexPath
        ) as? T else {
            fatalError("Failed to dequeue a cell with identifier \(reuseIdentifier) matching type \(cellType.self).")
        }

        return cell
    }

    final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(
        _ viewType: T.Type = T.self
    ) -> T? where T: Reusable {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: viewType.reuseIdentifier) as? T? else {
            fatalError("Failed to dequeue a header/footer with identifier \(viewType.reuseIdentifier) matching type \(viewType.self).")
        }

        return view
    }
}

