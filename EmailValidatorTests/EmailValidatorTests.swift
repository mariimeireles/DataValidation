//
//  EmailValidatorTests.swift
//  EmailValidatorTests
//
//  Created by Mariana Meireles | Stone on 2/6/18.
//  Copyright © 2018 Mariana Meireles | Stone. All rights reserved.
//

import XCTest
@testable import DataValidation

class EmailValidatorTests: XCTestCase {
    
    private let ACCEPTED = true
    private let REJECTED = false
    private var emailValidatorUnderTest: EmailValidator!
    
    override func setUp() {
        super.setUp()
        emailValidatorUnderTest = EmailValidator()
    }
    
    override func tearDown() {
        emailValidatorUnderTest = nil
        super.tearDown()
    }
    
    func test_shouldntAccept_anEmptyEmail() {
        let emptyEmail = ""
        let validation = emailValidatorUnderTest.validate(inputEmail: emptyEmail)
        XCTAssertEqual(validation, REJECTED)
    }
    
    func test_shouldntAccept_emailWithoutLocalPart() {
        let emailWithoutLocalPart = "@gmail.com"
        let validation = emailValidatorUnderTest.validate(inputEmail: emailWithoutLocalPart)
        XCTAssertEqual(validation, REJECTED)
    }
    
    func test_shouldntAccept_emailWithoutDomain() {
        let emailWithoutDomain = "mariana@"
        let validation = emailValidatorUnderTest.validate(inputEmail: emailWithoutDomain)
        XCTAssertEqual(validation, REJECTED)
    }
    
    func test_shouldntAccept_emailWithoutAt() {
        let emailWithoutAt = "marianagmail.com"
        let validation = emailValidatorUnderTest.validate(inputEmail: emailWithoutAt)
        XCTAssertEqual(validation, REJECTED)
    }
    
    func test_shouldntAccept_invalidEmail() {
        let invalidsEmail = ["Abc.example.com", "A@b@c@example.com", "a\"b(c)d,e:f;g<h>i[j\\k]l@example.com", "just\"not\"right@example.com", "this is\"not\\allowed@example.com", "this\\ still\\\"not\\\\allowed@example.com", "john..doe@example.com", "example@localhost", "john.doe@example..com", "\" \"@example.org"]
        emailLoop(invalidsEmail, status: REJECTED)
    }
    
    func test_shouldAccept_validEmail() {
        let validsEmail = ["prettyandsimple@example.com", "very.common@example.com", "disposable.style.email.with+symbol@example.com", "other.email-with-dash@example.com", "fully-qualified-domain@example.com", "user.name+tag+sorting@example.com", "x@example.com", "example-indeed@strange-example.com", "#!$%&'*+-/=?^_`{}|~@example.org", "example@s.solutions"]
        emailLoop(validsEmail, status: ACCEPTED)
    }
    
    func emailLoop(_ emailArray: [String], status: Bool) -> (){
        for email in emailArray {
            let validation = emailValidatorUnderTest.validate(inputEmail: email)
            return XCTAssertEqual(validation, status)
        }
    }
    
}
