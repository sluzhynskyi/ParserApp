//
//  ViewStyle.swift
//  SimpleApp
//
//  Created by Danylo Sluzhynskyi on 28.01.2023.
//

import UIKit

struct ViewStyle<View: UIView> {

        // MARK: - Properties

    private let configuration: (View) -> Void


        // MARK: - Initialization

    init<ParentView: UIView>(
        parent: ViewStyle<ParentView>? = nil,
        _ configuration: ((View) -> Void)? = nil
    ) {
        self.configuration = {
            if let parentView = $0 as? ParentView {
                parent?.apply(to: parentView)
            }

            configuration?($0)
        }
    }


        // MARK: - Appearance

    func apply(to views: View...) {
        for view in views {
            configuration(view)
        }
    }

    func wrapped<WrapperView: UIView>() -> ViewStyle<WrapperView> {
        ViewStyle<WrapperView>(parent: self) { _ in }
    }
}

protocol ViewStylable { }

extension UIView: ViewStylable { }

extension ViewStylable where Self: UIView {

        // MARK: - Initialization

    init(_ configuration: ((Self) -> Void)? = nil) {
        self.init()

        apply(
            ViewStyle<Self>(configuration)
        )
    }

    init(styles: [ViewStyle<Self>], configuration: ((Self) -> Void)? = nil) {
        self.init(configuration)

        apply(styles)
    }

    init(style: ViewStyle<Self>, configuration: ((Self) -> Void)? = nil) {
        self.init(configuration)

        apply(style)
    }


        // MARK: - Appearance

    static func style<V>(
        parent: ViewStyle<V>? = nil,
        _ configuration: ((Self) -> Void)? = nil
    ) -> ViewStyle<Self> {
        ViewStyle<Self>(
            parent: parent,
            configuration ?? { _ in }
        )
    }

    func apply(_ styles: [ViewStyle<Self>]) {
        styles.forEach({ $0.apply(to: self) })
    }

    func apply(_ style: ViewStyle<Self>) {
        style.apply(to: self)
    }
}
