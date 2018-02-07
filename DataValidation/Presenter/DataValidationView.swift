//
//  DataValidationView.swift
//  DataValidation
//
//  Created by Mariana Meireles | Stone on 2/7/18.
//  Copyright © 2018 Mariana Meireles | Stone. All rights reserved.
//

import Foundation

protocol DataValidationView {
    
    func onNameInvalid(state: DataValidatorState)
    func onEmailInvalid(state: DataValidatorState)
    func onCPFInvalid(state: DataValidatorState)
    func onReadyToValidate()

    var isConfirmButtonEnabled: Bool { get }
    func enableConfirmButton()
    func disableConfirmButton()
    func clearAllFields()
}
