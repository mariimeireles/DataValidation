//
//  NameValidator.swift
//  DataValidation
//
//  Created by Mariana Meireles | Stone on 2/2/18.
//  Copyright © 2018 Mariana Meireles | Stone. All rights reserved.
//

import Foundation

class NameValidator {
    
    func validate(inputValue: String) -> Bool {
        let formattedString = inputValue.replacingOccurrences(of: " ", with: "")
        if formattedString.count < 4 || formattedString.count > 60 {
            return false
        }
        if inputValue.hasSuffix(" ") || inputValue.hasPrefix(" ") {
            return false
        }
        return true
    }
    
}
