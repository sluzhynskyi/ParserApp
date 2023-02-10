//
//  LayoutView.swift
//  SimpleApp
//
//  Created by Danylo Sluzhynskyi on 29.07.2021.
//

import Foundation

protocol LayoutView: ViewRepresentable {
    associatedtype Layout: ViewLayout

    var layout: Layout { get }

    func processLayout()
}

extension LayoutView {
    func configuredLayout() -> Layout {
        Layout(root: self as! Self.Layout.View)
    }
}
