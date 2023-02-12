//
//  ControllerViewModel.swift
//  SimpleApp
//
//  Created by Danylo Sluzhynskyi on 29.07.2021.
//

import Foundation

protocol ControllerViewModel: ViewModel { }

protocol ViewModel: Applyable {
    func configure()
}

extension ViewModel {
    func configure() { }
}
