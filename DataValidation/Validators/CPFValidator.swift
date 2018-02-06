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
        
        let invalidsCPF = ["00000000000", "11111111111", "22222222222", "33333333333", "44444444444", "55555555555", "66666666666", "77777777777", "88888888888", "99999999999", "12345678909"]
        if invalidsCPF.contains(inputCPF) {
            return false
        }
        
        let numbers = formattedString.flatMap({Int(String($0))})
        guard numbers.count == 11 && Set(numbers).count != 1 else { return false }
        
        let div1 = makeCount(numbers: numbers, number: 10)
        let div2 = makeCount(numbers: numbers, number: 11)
        
        return div1 == numbers[9] && div2 == numbers[10]
    }
    
    func makeCount(numbers: [Int], number: Int) ->  Int {
        var index = 0
        var result = 0
        var plus = number
        repeat {
            result += numbers[index] * plus
            index += 1
            plus -= 1
        } while plus >= 2
        let sum = 11 - (result) % 11
        let div = sum > 9 ? 0 : sum
        return div
    }

    
}
