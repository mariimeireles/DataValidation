//
//  CPFValidator.swift
//  DataValidation
//
//  Created by Mariana Meireles | Stone on 2/5/18.
//  Copyright © 2018 Mariana Meireles | Stone. All rights reserved.
//

import Foundation

class CPFValidator {
    
    func validate(inputCPF: String) -> Bool {
        
        let formattedString = inputCPF.replacingOccurrences(of: "-.", with: "", options: .regularExpression, range: nil)
        print ("STRING: \(formattedString)")
        if formattedString.count < 4 || formattedString.count > 60 {
            return false
        }
        
        return true
    }
    
}
