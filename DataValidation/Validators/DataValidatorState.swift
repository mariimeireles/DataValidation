//
//  DataValidatorState.swift
//  DataValidation
//
//  Created by Mariana Meireles | Stone on 2/7/18.
//  Copyright © 2018 Mariana Meireles | Stone. All rights reserved.
//

import Foundation
import UIKit

enum DataValidatorState {
    
    case `default`
    case valid
    case invalid
    
    init(isValid: Bool) {
        if isValid {
            self = .valid
        } else {
            self = .invalid
        }
    }
    
    var color: UIColor {
        switch self {
        case .default:
            return .clear
        case .valid:
            return UIColor(red:0.07, green:0.46, blue:0.25, alpha:1.0)
        case .invalid:
            return .red
        }
    }
    
    var text: String {
        switch self{
        case .default:
            return ""
        case .valid:
            return "válido :)"
        case .invalid:
            return "inválido :("
        }
    }
    
}
