//
//  CreateTransactionViewController.swift
//  AccountApp
//
//  Created by zombietux on 15/01/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

protocol CreateTransactionViewControllerDelegate: class {
    func add(newTransaction: Transaction)
}

class CreateTransactionViewController: UIViewController {
    
    weak var delegate: CreateTransactionViewControllerDelegate?
    
    var newTransactionView: NewTransactionView {
        return view as! NewTransactionView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "SaveTransactionSegue" else {
            return
        }
        guard let amount = newTransactionView.amount,
            let description = newTransactionView.transactionDescription,
            let category = newTransactionView.selectedCategory else {
                return
        }
        let transaction = Transaction(amount: amount, description: description, date: Date(), category: category)
        delegate?.add(newTransaction: transaction)
    }
}
