//
//  View.swift
//  SimpleApp
//
//  Created by Danylo Sluzhynskyi on 29.07.2021.
//

import UIKit

class View: UIView {

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
}

