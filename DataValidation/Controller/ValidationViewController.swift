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
    
    private lazy var presenter: DataValidationPresenter = {
        return DataValidationPresenter(view: self, nameValidator: nameValidator, emailValidator: emailValidator, cpfValidator: cpfValidator)
    }()
    
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
    
    private func validate(textField: UITextField) {
        let text = textField.text ?? ""
        if textField == nameTextField {
            presenter.userNameChanged(name: text)
        }
        else if textField == emailTextField {
            presenter.userEmailChanged(email: text)
        }
        else {
            presenter.userCPFChanged(cpf: text)
        }
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        onReadyToValidate()
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        validate(textField: textField)
        
        if (nameTextField.text?.isEmpty)! {
            nameLabelNote.text = ""
        }
        if (emailTextField.text?.isEmpty)! {
            emailLabelNote.text = ""
        }
        if (cpfTextField.text?.isEmpty)! {
            cpfLabelNote.text = ""
        }
    }
}

extension ValidationViewController: DataValidationView {
    
    var isConfirmButtonEnabled: Bool {
        return confirmButton.isEnabled
    }
    
    func onNameInvalid(state: DataValidatorState) {
        nameLabelNote.text = "nome " + state.text
        nameLabelNote.textColor = state.color
    }
    
    func onEmailInvalid(state: DataValidatorState) {
        emailLabelNote.text = "email " + state.text
        emailLabelNote.textColor = state.color
    }
    
    func onCPFInvalid(state: DataValidatorState) {
        cpfLabelNote.text = "cpf " + state.text
        cpfLabelNote.textColor = state.color
    }
    
    func onReadyToValidate() {
        let confirmAlert = UIAlertController(title: "Parabéns!", message: "Seus dados estão validados", preferredStyle: UIAlertControllerStyle.alert)
        confirmAlert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction!) -> Void in
            self.presenter.resetViewState()
        }))
        self.present(confirmAlert, animated: true, completion: nil)
    }
    
    func enableConfirmButton() {
        confirmButton.isEnabled = true
    }
    
    func disableConfirmButton() {
        confirmButton.isEnabled = false
    }
    
    func clearAllFields() {
        self.nameTextField.text = ""
        self.emailTextField.text = ""
        self.cpfTextField.text = ""
        self.nameLabelNote.text = ""
        self.emailLabelNote.text = ""
        self.cpfLabelNote.text = ""
    }
    
}

