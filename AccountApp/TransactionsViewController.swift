//
//  TransactionsViewController.swift
//  AccountApp
//
//  Created by zombietux on 15/01/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

class TransactionsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    var account: Account!
    var stateController: StateController!
    
    fileprivate var dataSource: TransactionsDataSource!
    
    @IBAction func cancelTransactionCreation(_ segue: UIStoryboardSegue) {}
    @IBAction func saveTransaction(_ segue: UIStoryboardSegue) {}

    override func viewDidLoad() {
        super.viewDidLoad()

        numberLabel.text = account.number.accountNumberFormatting
        navigationItem.title = account.name
    }
  
    override func viewWillAppear(_ animated: Bool) {
        totalLabel.text = account.total.dollarsFormatting
        super.viewWillAppear(animated)
        dataSource = TransactionsDataSource(transactions: account.transactions)
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationController = segue.destination as? UINavigationController,
            let createTransactionViewController = navigationController.viewControllers.first as? CreateTransactionViewController {
            createTransactionViewController.delegate = self
        }
    }
    
}

extension TransactionsViewController: CreateTransactionViewControllerDelegate {
    func add(newTransaction: Transaction) {
        account.transactions.append(newTransaction)
        stateController.update(account)
    }
}

class TransactionsDataSource: NSObject {
    let transactions: [Transaction]
    
    init(transactions: [Transaction]) {
        self.transactions = transactions
    }
}

extension TransactionsDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath) as! TransactionCell
        let transaction = transactions[indexPath.row]
        cell.model = TransactionCell.Model(transaction: transaction)
        return cell
    }
}
