//
//  NewTransactionView.swift
//  AccountApp
//
//  Created by zombietux on 15/01/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

class NewTransactionView: UIView {
    
    var stateController: StateController!

    @IBOutlet fileprivate weak var amountTextField: UITextField!
    @IBOutlet fileprivate weak var descriptionTextField: UITextField!
    @IBOutlet fileprivate var ringViews: [UIView]!
    @IBOutlet fileprivate var categoryButtons: [UIButton]!
    
    fileprivate var selectedIndex = 0
    
    var amount: Float? {
        guard let text = amountTextField.text else {
            return nil
        }
        return Float(text)
    }
    
    var transactionDescription: String? {
        return descriptionTextField.text
    }
    
    var selectedCategory: TransactionCategory? {
        switch selectedIndex {
        case 0: return .income
        case 1: return .groceries
        case 2: return .utilities
        case 3: return .home
        case 4: return .transport
        case 5: return .fun
        default: return nil
        }
    }
    
    override func awakeFromNib() {
        resetRings()
    }
    
    @IBAction func selectCategory(_ sender: UIButton) {
        resetRings()
        selectedIndex = categoryButtons.index(of: sender)!
        let selectedRingView = ringViews[selectedIndex]
        selectedRingView.layer.borderColor = UIColor.skyBlue.cgColor
    }
}

fileprivate extension NewTransactionView {
    func resetRings() {
        for ringView in ringViews {
            ringView.layer.borderColor = UIColor.clear.cgColor
        }
    }
}
