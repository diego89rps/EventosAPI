//
//  UIFontExtensions.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 16/11/20.
//

import UIKit

public enum AvertaStyle: String {
    case black = "Averta-Black"
    case black_italic = "Averta-BlackItalic"
    case bold = "Averta-Bold"
    case bold_italic = "Averta-BoldItalic"
    case extra_bold = "Averta-ExtraBold"
    case extra_bold_italic = "Averta-ExtraBoldItalic"
    case extra_thin = "Averta-ExtraThin"
    case extra_thin_italic = "Averta-ExtraThinItalic"
    case light = "Averta-Light"
    case light_italic = "Averta-LightItalic"
    case regular = "Averta-Regular"
    case regular_italic = "Averta-RegularItalic"
    case semibold = "Averta-Semibold"
    case semibold_italic = "Averta-SemiboldItalic"
    case thin = "Averta-Thin"
    case thin_italic = "Averta-ThinItalic"
}

extension UIFont {
    
    public convenience init?(fontStyle: AvertaStyle, withSize: CGFloat) {
        self.init(name: fontStyle.rawValue, size: withSize)
    }
    
    static func averta(_ style: AvertaStyle = .regular, withSize size: CGFloat) -> UIFont {
        var font: UIFont?
        
        switch style {
        case .black:
            font = UIFont(fontStyle: .black, withSize: size)
            
        case .black_italic:
            font = UIFont(fontStyle: .black_italic, withSize: size)
            
        case .bold:
            font = UIFont(fontStyle: .bold, withSize: size)
            
        case .bold_italic:
            font = UIFont(fontStyle: .bold_italic, withSize: size)
            
        case .extra_bold:
            font = UIFont(fontStyle: .extra_bold, withSize: size)
            
        case .extra_bold_italic:
            font = UIFont(fontStyle: .extra_bold_italic, withSize: size)
            
        case .extra_thin:
            font = UIFont(fontStyle: .extra_thin, withSize: size)
            
        case .extra_thin_italic:
            font = UIFont(fontStyle: .extra_thin_italic, withSize: size)
            
        case .light:
            font = UIFont(fontStyle: .light, withSize: size)
            
        case .light_italic:
            font = UIFont(fontStyle: .light_italic, withSize: size)
            
        case .semibold:
            font = UIFont(fontStyle: .semibold, withSize: size)
            
        case .semibold_italic:
            font = UIFont(fontStyle: .semibold_italic, withSize: size)
            
        case .thin:
            font = UIFont(fontStyle: .thin, withSize: size)
            
        case .thin_italic:
            font = UIFont(fontStyle: .thin_italic, withSize: size)
            
        case .regular_italic:
            font = UIFont(fontStyle: .regular_italic, withSize: size)
            
        default:
            font = UIFont(fontStyle: .regular, withSize: size)
        }
        return font!
    }
}
