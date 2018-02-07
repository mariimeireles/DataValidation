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
    @IBOutlet weak var nameLabelNote: UILabel!
    @IBOutlet weak var emailLabelNote: UILabel!
    @IBOutlet weak var cpfLabelNote: UILabel!
    
    var nameValidator = NameValidator()
    var cpfValidator = CPFValidator()
    var emailValidator = EmailValidator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        nameTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        cpfTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        cpfTextField.keyboardType = .numberPad
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if textField == nameTextField {
            let newLength = (textField.text?.count)! + string.count - range.length
            return newLength <= 60
        }
        
        if textField == cpfTextField{
            if let stringText = cpfTextField.text {
                if (stringText.count == 3 || stringText.count == 7) && string != ""{
                    cpfTextField.text = "\(cpfTextField.text!).\(string)"
                    return false
                }
                if (stringText.count == 11) && string != ""{
                    cpfTextField.text = "\(cpfTextField.text!)-\(string)"
                    return false
                }
                if range.length + range.location > (cpfTextField.text?.count)!{
                    return false
                }
                let newLenght = (cpfTextField.text?.count)! + string.count - range.length
                return newLenght <= 14
            }
        }
        return true
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        let confirmAlert = UIAlertController(title: "Parabéns!", message: "Seus dados estão validados", preferredStyle: UIAlertControllerStyle.alert)
        confirmAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) -> Void in
            self.confirmButton.isEnabled = false
            self.nameTextField.text = ""
            self.emailTextField.text = ""
            self.cpfTextField.text = ""
            self.clearNotes()
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
            let name = nameTextField.text,
            let email = emailTextField.text,
            let cpf = cpfTextField.text
            else {
                return
            }
        
        if !name.isEmpty {
            let nameResponse = nameValidator.validate(inputName: name)
            switch nameResponse {
            case true:
                nameLabelNote.text = "nome válido :)"
                nameLabelNote.textColor = UIColor(red:0.07, green:0.46, blue:0.25, alpha:1.0)
            case false:
                nameLabelNote.text = "nome inválido :("
                nameLabelNote.textColor = .red
            }
        } else {
            nameLabelNote.text = ""
        }
        
        if !email.isEmpty {
            let emailResponse = emailValidator.validate(inputEmail: email)
            switch emailResponse {
            case true:
                emailLabelNote.text = "email válido :)"
                emailLabelNote.textColor = UIColor(red:0.07, green:0.46, blue:0.25, alpha:1.0)
            case false:
                emailLabelNote.text = "email inválido :("
                emailLabelNote.textColor = .red
            }
        } else {
            emailLabelNote.text = ""
        }
        
        if !cpf.isEmpty {
            let cpfResponse = cpfValidator.validate(inputCPF: cpf)
            switch cpfResponse {
            case true:
                cpfLabelNote.text = "CPF válido :)"
                cpfLabelNote.textColor = UIColor(red:0.07, green:0.46, blue:0.25, alpha:1.0)
            case false:
                cpfLabelNote.text = "CPF inválido :("
                cpfLabelNote.textColor = .red
            }
        } else {
            cpfLabelNote.text = ""
        }
        
        guard
            nameValidator.validate(inputName: name) == true,
            cpfValidator.validate(inputCPF: cpf) == true,
            emailValidator.validate(inputEmail: email) == true
            else {
                confirmButton.isEnabled = false
                return
            }
        confirmButton.isEnabled = true
    }
    
    func clearNotes() {
        nameLabelNote.text = ""
        emailLabelNote.text = ""
        cpfLabelNote.text = ""
    }
    
    
}

