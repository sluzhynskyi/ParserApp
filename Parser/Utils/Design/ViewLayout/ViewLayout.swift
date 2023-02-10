//
//  ViewLayout.swift
//  SimpleApp
//
//  Created by Danylo Sluzhynskyi on 29.07.2021.
//

import UIKit

protocol ViewLayout {
    associatedtype View: ViewRepresentable

    var root: View { get }

    init(root: View)

    mutating func process()
    func willLayoutSubviews()
    func didLayoutSubviews()
}

extension ViewLayout {
    func willLayoutSubviews() { }
    func didLayoutSubviews() { }
}

extension ViewLayout where Self.View: UIView {
    func addRootSubview(_ view: UIView) {
        root.addSubview(view)
    }

    func addRootSubviews(_ views: [UIView]) {
        views.forEach(root.addSubview(_:))
    }
}

extension ViewLayout where Self.View: UIViewController {
    func addRootSubview(_ view: UIView) {
        root.view.addSubview(view)
    }

    func addRootSubviews(_ views: [UIView]) {
        views.forEach(root.view.addSubview(_:))
    }
}
