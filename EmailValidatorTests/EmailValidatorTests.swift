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
    
    let ACCEPTED = true
    let REJECTED = false
    var emailValidatorUnderTest: EmailValidator!
    
    override func setUp() {
        super.setUp()
        emailValidatorUnderTest = EmailValidator()
    }
    
    override func tearDown() {
        emailValidatorUnderTest = nil
        super.tearDown()
    }
    
    func test_shouldntAccept_invalidEmail() {
        let invalidsEmail = ["Abc.example.com", "A@b@c@example.com", "a\"b(c)d,e:f;g<h>i[j\\k]l@example.com", "just\"not\"right@example.com", "this is\"not\\allowed@example.com", "this\\ still\\\"not\\\\allowed@example.com", "1234567890123456789012345678901234567890123456789012345678901234+x@example.com", "john..doe@example.com", "example@localhost", "john.doe@example..com", "\" \"@example.org", "\"very.unusual.@.unusual.com\"@example.com"]
        for email in invalidsEmail{
            let validation = emailValidatorUnderTest.validate(inputEmail: email)
            XCTAssertEqual(validation, REJECTED)
        }
    }
    
}
