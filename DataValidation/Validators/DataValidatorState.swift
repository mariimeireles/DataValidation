//
//  DataValidatorState.swift
//  DataValidation
//
//  Created by Mariana Meireles | Stone on 2/7/18.
//  Copyright © 2018 Mariana Meireles | Stone. All rights reserved.
//

import Foundation

enum DataValidatorState {
    
    case `default`
    case valid
    case invalid
    
    init(isValid: Bool) {
        if isValid {
            self = .valid
        }
        else {
            self = .invalid
        }
    }
    
}
