//
//  Appyable.swift
//  Parser
//
//  Created by Danylo Sluzhynskyi on 10.02.2023.
//

import Foundation

protocol Applyable { }

extension Applyable {

        // MARK: - Appearance

    @discardableResult
    func apply(_ configuration: (Self) throws -> Void) rethrows -> Self {
        try configuration(self)

        return self
    }
}

extension NSObject: Applyable { }

