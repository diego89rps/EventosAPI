//
//  UIColorExtension.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 16/11/20.
//

import UIKit

public enum ColorName: String {
    case defaultDarkBlue = "defaultDarkBlue"
    case defaultLightBlue = "defaultLightBlue"
    case defaultMediumBlue = "defaultMediumBlue"
    case defaultWhite = "defaultWhite"

}

extension UIColor {
    
    public convenience init?(colorName: ColorName) {
        self.init(named: colorName.rawValue)
    }
    
    static func defaultColor(_ colorName: ColorName) -> UIColor {
        return UIColor.init(named: colorName.rawValue)!
    }
}
