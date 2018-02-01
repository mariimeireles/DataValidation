//
//  NameValidator.swift
//  DataValidation
//
//  Created by Mariana Meireles | Stone on 2/1/18.
//  Copyright © 2018 Mariana Meireles | Stone. All rights reserved.
//

import Foundation

class NameValidator {
    
    func validate(name: String){
        
//        let formattedName = name.replacingOccurrences(of: " ", with: "")
//        if formattedName.count > 4 && formattedName.count < 60{
        if name.count > 4 {
            print("true")
//            return true
        } else {
            print("false")
//            return false
        }
    }
}
