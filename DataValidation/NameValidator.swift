//
//  NameValidator.swift
//  DataValidation
//
//  Created by Mariana Meireles | Stone on 2/2/18.
//  Copyright © 2018 Mariana Meireles | Stone. All rights reserved.
//

import Foundation
import UIKit

class NameValidator: NSObject {
        
    func validate(inputValue: String, label: UILabel) -> Bool {
        let formattedString = inputValue.replacingOccurrences(of: " ", with: "")
        if formattedString.count < 4 {
            label.text = "o nome deve ter mais de 4 letras"
            label.textColor = .red
            return false
        }
        if formattedString.count > 60 {
            label.text = "o nome deve ter menos de 60 letras"
            label.textColor = .red
            return false
        }

        label.text = "nome valido :)"
        label.textColor = UIColor(red:0.07, green:0.46, blue:0.25, alpha:1.0)
        return true
    }
    

}
