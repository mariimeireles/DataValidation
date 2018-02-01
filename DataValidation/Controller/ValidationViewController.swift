//
//  ViewController.swift
//  DataValidation
//
//  Created by Mariana Meireles | Stone on 2/1/18.
//  Copyright © 2018 Mariana Meireles | Stone. All rights reserved.
//

import UIKit

class ValidationViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var confirmButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        nameTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        cpfTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        let confirmAlert = UIAlertController(title: "Parabéns!", message: "Seus dados estão validados", preferredStyle: UIAlertControllerStyle.alert)
        confirmAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) -> Void in
            self.confirmButton.isEnabled = false
            self.nameTextField.text = ""
            self.emailTextField.text = ""
            self.cpfTextField.text = ""
        }))
        self.present(confirmAlert, animated: true, completion: nil)
        
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let name = nameTextField.text, !name.isEmpty,
            let email = emailTextField.text, !email.isEmpty,
            let cpf = cpfTextField.text, !cpf.isEmpty
            else {
                confirmButton.isEnabled = false
                return
        }
        confirmButton.isEnabled = true
    }
    
    
}

