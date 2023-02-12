//
//  Reusable.swift
//  Parser
//
//  Created by Danylo Sluzhynskyi on 12.02.2023.
//

import Foundation

protocol Reusable: AnyObject {

        // MARK: - Properties

    static var reuseIdentifier: String { get }

}

extension Reusable {

        // MARK: - Properties

    static var reuseIdentifier: String {
        String(describing: self)
    }
}
