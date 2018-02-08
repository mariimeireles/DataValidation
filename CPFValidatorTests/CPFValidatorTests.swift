//
//  CPFValidatorTests.swift
//  CPFValidatorTests
//
//  Created by Mariana Meireles | Stone on 2/5/18.
//  Copyright © 2018 Mariana Meireles | Stone. All rights reserved.
//

import XCTest
@testable import DataValidation

class CPFValidatorTests: XCTestCase {
    
    private let ACCEPTED = true
    private let REJECTED = false
    private var cpfValidatorUnderTest: CPFValidator!
    
    override func setUp() {
        super.setUp()
        cpfValidatorUnderTest = CPFValidator()
    }
    
    override func tearDown() {
        cpfValidatorUnderTest = nil
        super.tearDown()
    }
    
    func test_shouldntAccept_anEmptyCPF() {
        let emptyCPF = ""
        let validation = cpfValidatorUnderTest.validate(inputCPF: emptyCPF)
        XCTAssertEqual(validation, REJECTED)
    }
    
    func test_shouldntAccept_falseCPF() {
        let falseCPF = "12345678909"
        let validation = cpfValidatorUnderTest.validate(inputCPF: falseCPF)
        XCTAssertEqual(validation, REJECTED)
    }
    
    func test_shouldntAccept_alphanumericCPF() {
        let alphanumericCPF = "a1b2c3d4e5f"
        let validation = cpfValidatorUnderTest.validate(inputCPF: alphanumericCPF)
        XCTAssertEqual(validation, REJECTED)
    }
    
    func test_shouldntAccept_lessDigits() {
        let lessDigits = "123456"
        let validation = cpfValidatorUnderTest.validate(inputCPF: lessDigits)
        XCTAssertEqual(validation, REJECTED)
    }
    
    func test_shouldntAccept_moreDigits() {
        let moreDigits = "1234567890987"
        let validation = cpfValidatorUnderTest.validate(inputCPF: moreDigits)
        XCTAssertEqual(validation, REJECTED)
    }
    
    func test_shouldAccept_validCPF() {
        let validCPF = "14284434799"
        let validation = cpfValidatorUnderTest.validate(inputCPF: validCPF)
        XCTAssertEqual(validation, ACCEPTED)
    }
    
}
