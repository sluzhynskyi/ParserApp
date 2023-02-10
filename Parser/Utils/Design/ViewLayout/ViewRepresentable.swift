//
//  ViewRepresentable.swift
//  SimpleApp
//
//  Created by Danylo Sluzhynskyi on 29.07.2021.
//

import UIKit

protocol ViewRepresentable: AnyObject { }

extension UIView: ViewRepresentable { }
extension UIViewController: ViewRepresentable { }
