//
//  Button.swift
//  SimpleApp
//
//  Created by Danylo Sluzhynskyi on 29.07.2021.
//

import UIKit

class Button: UIButton {

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
            if alpha != 0 {
                alpha = isHighlighted ? 0.8 : 1
            }
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

    }

    // MARK: Attachments

    private func attachTouchUpInsideEvent() {
        addTarget(self, action: #selector(touchedUpInside), for: .touchUpInside)
    }

    // MARK: Actions

    @objc
    private func touchedUpInside() {
        didTouchUpInside?()
    }
}

