//
//  DoubleExtension.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 13/12/20.
//

import Foundation

public extension Double {
        
    func formatToMoney(withPrefix: Bool) -> String {
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .currency
        formatter.currencySymbol = withPrefix ? "R$ " : ""
        formatter.currencyDecimalSeparator = ","
        formatter .currencyGroupingSeparator = "."
        
        return formatter.string(from: NSNumber(value: self))!
    }
}
