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
        
        let formattedString = inputCPF.replacingOccurrences(of: "[-.]", with: "", options: .regularExpression, range: nil)
        
        if formattedString == "00000000000" || formattedString == "11111111111" || formattedString == "22222222222" || formattedString == "33333333333" || formattedString == "44444444444" || formattedString == "55555555555" || formattedString == "66666666666" || formattedString == "77777777777" || formattedString == "88888888888" || formattedString == "99999999999" || formattedString == "12345678909" {
            return false
        }
        
        let numbers = formattedString.flatMap({Int(String($0))})
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        let soma1 = 11 - ( numbers[0] * 10 +
            numbers[1] * 9 +
            numbers[2] * 8 +
            numbers[3] * 7 +
            numbers[4] * 6 +
            numbers[5] * 5 +
            numbers[6] * 4 +
            numbers[7] * 3 +
            numbers[8] * 2 ) % 11
        let dv1 = soma1 > 9 ? 0 : soma1
        let soma2 = 11 - ( numbers[0] * 11 +
            numbers[1] * 10 +
            numbers[2] * 9 +
            numbers[3] * 8 +
            numbers[4] * 7 +
            numbers[5] * 6 +
            numbers[6] * 5 +
            numbers[7] * 4 +
            numbers[8] * 3 +
            numbers[9] * 2 ) % 11
        let dv2 = soma2 > 9 ? 0 : soma2
        return dv1 == numbers[9] && dv2 == numbers[10]
    }
    
}
