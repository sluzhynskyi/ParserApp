//
//  Control.swift
//  SimpleApp
//
//  Created by Danylo Sluzhynskyi on 29.07.2021.
//

import UIKit

class Control: UIControl {

    // MARK: - Properties
    // MARK: Outputs

    var didTouchUpInside: EmptyClosure? {
        didSet {
            attachTouchUpInsideEvent()
        }
    }

    // MARK: Overrides

    override var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.9 : 1
        }
    }


    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        configure()
    }


    // MARK: - UI
    // MARK: Configuration

    func configure() {
        backgroundColor = .clear
    }

    private func attachTouchUpInsideEvent() {
        addTarget(self, action: #selector(touchedUpInside), for: .touchUpInside)
    }

    // MARK: Actions

    @objc
    func touchedUpInside() {
        didTouchUpInside?()
    }
}
