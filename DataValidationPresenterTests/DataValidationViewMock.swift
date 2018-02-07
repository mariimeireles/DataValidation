//
//  DataValidationViewMock.swift
//  DataValidation
//
//  Created by Mariana Meireles | Stone on 2/7/18.
//  Copyright © 2018 Mariana Meireles | Stone. All rights reserved.
//

import Foundation

@testable import DataValidation
import XCTest

class DataValidationViewMock {
    
    private var map: [String: DataValidatorState] = [:]
    private var confirmButtonState = false
    
}

extension DataValidationViewMock: DataValidationView {
    
    func onNameInvalid(state: DataValidatorState) {
        map["onNameChange"] = state
    }
    
    func onEmailInvalid(state: DataValidatorState) {
        map["onEmailChange"] = state
    }
    
    func onCPFInvalid(state: DataValidatorState) {
        map["onCpfChange"] = state
    }
    
    
    func onReadyToValidate() {
        
    }
    
    var isConfirmButtonEnabled: Bool {
        return confirmButtonState
    }
    
    func enableConfirmButton() {
        confirmButtonState = true
    }
    
    func disableConfirmButton() {
        confirmButtonState = false
    }

}

