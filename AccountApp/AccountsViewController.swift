//
//  AccountsViewController.swift
//  AccountApp
//
//  Created by zombietux on 15/01/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

class AccountsViewController: UIViewController {
    var stateController: StateController!
    
    @IBAction func cancelAccountCreation(_ segue: UIStoryboardSegue) {}
    @IBAction func saveAccount(_ segue: UIStoryboardSegue) {}

    @IBOutlet fileprivate weak var tableView: UITableView!
    
    fileprivate var dataSource: AccountsDataSource!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataSource = AccountsDataSource(accounts: stateController.accounts)
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "CreateAccountSegue":
            if let navigationController = segue.destination as? UINavigationController,
                let createAccountViewController = navigationController.viewControllers.first as? CreateAccountViewController {
                createAccountViewController.stateController = stateController
            }
        case "TransactionsSegue":
            if let transactionsViewController = segue.destination as? TransactionsViewController,
                let selectedIndex = tableView.indexPathForSelectedRow?.row {
                let account = dataSource.accounts[selectedIndex]
                transactionsViewController.account = account
                transactionsViewController.stateController = stateController
            }
        default:
            break
        }
    }
}

class AccountsDataSource: NSObject {
    var accounts: [Account]
    
    init(accounts: [Account]) {
        self.accounts = accounts
    }
}

extension AccountsDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath) as! AccountCell
        let index = indexPath.row
        let account = accounts[index]
        cell.model = AccountCell.Model(account: account, index: index)
        return cell
    }
}


