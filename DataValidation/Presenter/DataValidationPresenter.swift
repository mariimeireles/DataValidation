//
//  DataValidationPresenter.swift
//  DataValidation
//
//  Created by Mariana Meireles | Stone on 2/7/18.
//  Copyright © 2018 Mariana Meireles | Stone. All rights reserved.
//

import Foundation

class DataValidationPresenter {
    
    private let view: DataValidationView
    private let nameValidator: NameValidator
    private let emailValidator: EmailValidator
    private let cpfValidator: CPFValidator
    
    private var nameState: DataValidatorState = .default
    private var emailState: DataValidatorState = .default
    private var cpfState: DataValidatorState = .default
    
    init(view: DataValidationView, nameValidator: NameValidator, emailValidator: EmailValidator, cpfValidator: CPFValidator) {
        self.view = view
        self.nameValidator = nameValidator
        self.emailValidator = emailValidator
        self.cpfValidator = cpfValidator
    }
    
    private var allFieldsAreValid: Bool {
        return nameState == .valid && emailState == .valid && cpfState == .valid
    }
    
    func userNameChanged(name: String) {
        let isNameValid = nameValidator.validate(inputName: name)
        nameState = DataValidatorState(isValid: isNameValid)
        view.onNameInvalid(state: nameState)
        checkConfirmButton()
    }
    
    func userEmailChanged(email: String) {
        let isEmailValid = emailValidator.validate(inputEmail: email)
        emailState = DataValidatorState(isValid: isEmailValid)
        view.onEmailInvalid(state: emailState)
        checkConfirmButton()
    }
    
    func userCPFChanged(cpf: String) {
        let isCPFValid = cpfValidator.validate(inputCPF: cpf)
        cpfState = DataValidatorState(isValid: isCPFValid)
        view.onCPFInvalid(state: cpfState)
        checkConfirmButton()
    }
    
    func performValidate() {
        view.onReadyToValidate()
    }
    
    func resetViewState() {
        view.clearAllFields()
        view.disableConfirmButton()
        nameState = .invalid
        emailState = .invalid
        cpfState = .invalid
    }
    
    private func checkConfirmButton() {
        if allFieldsAreValid {
            view.enableConfirmButton()
        } else {
            view.disableConfirmButton()
        }
    }

}
