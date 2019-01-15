//
//  UIColor.swift
//  AccountApp
//
//  Created by zombietux on 15/01/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class var lightGrassGreen: UIColor {
        return UIColor(red: 171.0 / 255.0, green: 236.0 / 255.0, blue: 104.0 / 255.0, alpha: 1.0)
    }
    
    class var skyBlue: UIColor {
        return UIColor(red: 84.0 / 255.0, green: 199.0 / 255.0, blue: 252.0 / 255.0, alpha: 1.0)
    }
    
    class var seafoamBlue: UIColor {
        return UIColor(red: 93.0 / 255.0, green: 220.0 / 255.0, blue: 191.0 / 255.0, alpha: 1.0)
    }
    
    class var liliac: UIColor {
        return UIColor(red: 201.0 / 255.0, green: 138.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
    }
    
    class var sunflowerYellow: UIColor {
        return UIColor(red: 255.0 / 255.0, green: 205.0 / 255.0, blue: 0.0, alpha: 1.0)
    }
    
    class var carnation: UIColor {
        return UIColor(red: 253.0 / 255.0, green: 100.0 / 255.0, blue: 147.0 / 255.0, alpha: 1.0)
    }
    
    class var peach: UIColor {
        return UIColor(red: 253.0 / 255.0, green: 169.0 / 255.0, blue: 123.0 / 255.0, alpha: 1.0)
    }
    
    class var slate: UIColor {
        return UIColor(red: 80.0 / 255.0, green: 107.0 / 255.0, blue: 120.0 / 255.0, alpha: 1.0)
    }
    
    class var darkLimeGreen: UIColor {
        return UIColor(red: 111.0 / 255.0, green: 221.0 / 255.0, blue: 0.0, alpha: 1.0)
    }
    
    class func color(for index: Int) -> UIColor {
        switch index % 6 {
        case 0: return .lightGrassGreen
        case 1: return .seafoamBlue
        case 2: return .liliac
        case 3: return .sunflowerYellow
        case 4: return .peach
        default: return .carnation
        }
    }
}

extension TransactionCategory {
    struct Appearance {
        let color: UIColor
        let image: UIImage
    }
    
    var appearance: Appearance {
        switch self {
        case .income: return Appearance(color: .lightGrassGreen, image: #imageLiteral(resourceName: "income"))
        case .groceries: return Appearance(color: .seafoamBlue, image: #imageLiteral(resourceName: "groceries"))
        case .utilities: return Appearance(color: .liliac, image: #imageLiteral(resourceName: "utilities"))
        case .home: return Appearance(color: .sunflowerYellow, image: #imageLiteral(resourceName: "home"))
        case .transport: return Appearance(color: .peach, image: #imageLiteral(resourceName: "transport"))
        case .fun: return Appearance(color: .carnation, image: #imageLiteral(resourceName: "fun"))
        }
    }
}

extension Float {
    var dollarsFormatting: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        return formatter.string(from: NSNumber(value: self))!
    }
}

extension String {
    var accountNumberFormatting: String {
        var formattedString = ""
        for (index, character) in characters.enumerated() {
            if index % 4 < 3 || index == characters.count - 1 {
                formattedString.append(character)
            } else {
                formattedString.append("\(character) ")
            }
        }
        return formattedString
    }
}

extension Date {
    var transactionFormtting: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: self)
    }
}
