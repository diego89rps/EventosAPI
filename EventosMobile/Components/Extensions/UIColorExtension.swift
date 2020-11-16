//
//  UIColorExtension.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 16/11/20.
//

import UIKit

public enum ColorName: String {
    case defaultGreen = "defaultGreen"
    case defaultMediumGray = "defaultMediumGray"
    case defaultPurple = "defaultPurple"
    case defaultHeavyPurple = "defaultHeavyPurple"
    case defaultStrongGray = "defaultStrongGray"
    case defaultWeakGray = "defaultWeakGray"
    case defaultWhite = "defaultWhite"
    case defaultIceWhite = "defaultIceWhite"
    case bottomSheetLightGray = "bottomSheetLightGray"
    case defaultRed = "defaultRed"
    case cellTitleGray = "cellTitleGray"
}

extension UIColor {
    
    public convenience init?(colorName: ColorName) {
        self.init(named: colorName.rawValue)
    }
    
    static func defaultColor(_ colorName: ColorName) -> UIColor {
        return UIColor.init(named: colorName.rawValue)!
    }
}
