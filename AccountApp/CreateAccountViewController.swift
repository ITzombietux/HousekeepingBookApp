//
//  CreateAccountViewController.swift
//  AccountApp
//
//  Created by zombietux on 15/01/2019.
//  Copyright © 2019 zombietux. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    var stateController: StateController!

    @IBOutlet fileprivate weak var nameTextField: UITextField!
    @IBOutlet fileprivate weak var bankTextField: UITextField!
    @IBOutlet fileprivate weak var numberTextField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "SaveAccountSegue" else {
            return
        }
        let account = Account(name: nameTextField.text ?? "", bank: bankTextField.text ?? "", number: numberTextField.text ?? "", transactions: [])
        stateController.add(account)
    }
}
