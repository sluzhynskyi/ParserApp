//
//  ColorPalette.swift
//  SimpleApp
//
//  Created by Danylo Sluzhynskyi on 28.01.2023.
//

import UIKit

enum ColorPalette {

        // MARK: - Properties
        // MARK: Global

    static var primary: UIColor    { #colorLiteral(red: 0.3921568627, green: 0.3411764706, blue: 0.8509803922, alpha: 1) }
    static var primary10: UIColor  { #colorLiteral(red: 0.9490196078, green: 0.9411764706, blue: 1, alpha: 1) }
    static var primary20: UIColor  { #colorLiteral(red: 0.8470588235, green: 0.8196078431, blue: 1, alpha: 1) }
    static var primary50: UIColor  { #colorLiteral(red: 0.6196078431, green: 0.5960784314, blue: 0.8509803922, alpha: 1) }
    static var primary140: UIColor { #colorLiteral(red: 0.3058823529, green: 0.2509803922, blue: 0.6, alpha: 1) }

    static var secondary: UIColor    { #colorLiteral(red: 0.4, green: 0.8, blue: 0.9607843137, alpha: 1) }
    static var secondary10: UIColor  { #colorLiteral(red: 0.8980392157, green: 0.9764705882, blue: 1, alpha: 1) }
    static var secondary50: UIColor  { #colorLiteral(red: 0.6, green: 0.9019607843, blue: 1, alpha: 1) }
    static var secondary120: UIColor { #colorLiteral(red: 0.2117647059, green: 0.6235294118, blue: 0.7607843137, alpha: 1) }
    static var secondary180: UIColor { #colorLiteral(red: 0.1411764706, green: 0.2392156863, blue: 0.2784313725, alpha: 1) }

    static var destructive: UIColor    { #colorLiteral(red: 0.80, green: 0.24, blue: 0.14, alpha: 1.00) }
    static var destructive20: UIColor  { #colorLiteral(red: 1, green: 0.8901960784, blue: 0.8705882353, alpha: 1) }
    static var destructive100: UIColor { #colorLiteral(red: 0.9764705882, green: 0.4, blue: 0.3058823529, alpha: 1) }

    static var success: UIColor { #colorLiteral(red: 0.06274509804, green: 0.8, blue: 0.5803921569, alpha: 1) }

    static var white: UIColor { #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) }
    static var black: UIColor { #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) }

    static var grey5: UIColor  { #colorLiteral(red: 0.98, green: 0.98, blue: 0.98, alpha: 1) }
    static var grey10: UIColor { #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1) }
    static var grey20: UIColor { #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1) }
    static var grey40: UIColor { #colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1) }
    static var grey50: UIColor { #colorLiteral(red: 0.5529411765, green: 0.5529411765, blue: 0.5529411765, alpha: 1) }
    static var grey70: UIColor { #colorLiteral(red: 0.3215686275, green: 0.3215686275, blue: 0.3215686275, alpha: 1) }

        // MARK: Custom

    static var grey30: UIColor      { #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1) }
    static var systemGray5: UIColor { #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.9176470588, alpha: 1) }
    static var yellow100: UIColor   { #colorLiteral(red: 0.984, green: 0.737, blue: 0.02, alpha: 1) }
    static var red20: UIColor       { #colorLiteral(red: 1, green: 0.888, blue: 0.87, alpha: 1) }
    static var red120: UIColor      { #colorLiteral(red: 0.799, green: 0.235, blue: 0.141, alpha: 1) }
    static var clear: UIColor       { .clear }
}

extension UIColor {
    static var Palette: ColorPalette.Type {
        ColorPalette.self
    }
}

