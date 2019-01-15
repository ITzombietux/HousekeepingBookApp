//
//  Model.swift
//  AccountApp
//
//  Created by zombietux on 15/01/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import Foundation
import UIKit

enum TransactionCategory: String {
    case income
    case groceries
    case utilities
    case home
    case transport
    case fun
}

struct Transaction {
    let amount: Float // In a real app that deals with money you should not use floating point numbers!
    let description: String
    let date: Date
    let category: TransactionCategory
}

struct Account {
    let name: String
    let bank: String
    let number: String
    var transactions: [Transaction]
    
    var total: Float {
        return transactions.reduce(0.0, { $0 + $1.amount * ($1.category == .income ? 1 : -1) })
    }
}

extension Transaction {
    var plistRepresentation: [String: AnyObject] {
        return [
            "amount": amount as AnyObject,
            "description": description as AnyObject,
            "date": date as AnyObject,
            "category": category.rawValue as AnyObject
        ]
    }
    
    init(plist: [String: AnyObject]) {
        amount = plist["amount"] as! Float
        description = plist["description"] as! String
        date = plist["date"] as! Date
        category = TransactionCategory(rawValue: plist["category"] as! String)!
    }
}

extension Account {
    var plistRepresentation: [String: AnyObject] {
        return [
            "name": name as AnyObject,
            "bank": bank as AnyObject,
            "number": number as AnyObject,
            "transactions": transactions.map { $0.plistRepresentation } as AnyObject
        ]
    }
    
    init(plist: [String: AnyObject]) {
        name = plist["name"] as! String
        bank = plist["bank"] as! String
        number = plist["number"] as! String
        transactions = (plist["transactions"] as! [[String: AnyObject]]).map(Transaction.init(plist:))
    }
}
