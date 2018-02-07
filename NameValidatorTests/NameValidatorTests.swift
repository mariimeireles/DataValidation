//
//  NameValidatorTests.swift
//  NameValidatorTests
//
//  Created by Mariana Meireles | Stone on 2/2/18.
//  Copyright © 2018 Mariana Meireles | Stone. All rights reserved.
//

import XCTest
@testable import DataValidation

class NameValidatorTests: XCTestCase {
    
    private let ACCEPTED = true
    private let REJECTED = false
    private var nameValidatorUnderTest: NameValidator!

    override func setUp() {
        super.setUp()
        nameValidatorUnderTest = NameValidator()
    }
    
    override func tearDown() {
        nameValidatorUnderTest = nil
        super.tearDown()
    }
    
    func test_shouldntAccept_anEmptyName() {
        let emptyName = ""
        let validation = nameValidatorUnderTest.validate(inputName: emptyName)
        XCTAssertEqual(validation, REJECTED)
    }
    
    func test_shouldntAccept_nameWithoutLastName() {
        let nameWithoutLastName = "Mariana "
        let validation = nameValidatorUnderTest.validate(inputName: nameWithoutLastName)
        XCTAssertEqual(validation, REJECTED)
    }
    
    func test_shouldntAccept_lastNameWhithoutName() {
        let lastNameWithoutName = " Meireles"
        let validation = nameValidatorUnderTest.validate(inputName: lastNameWithoutName)
        XCTAssertEqual(validation, REJECTED)
    }
    
    func test_shouldntAccept_lessCharacters() {
        let name = "Ana"
        let validation = nameValidatorUnderTest.validate(inputName: name)
        XCTAssertEqual(validation, REJECTED)
    }
    
    func test_shouldntAccept_moreCharacters() {
        let name = "aaaaaaaaaa bbbbbbbbbb cccccccccc dddddddddd eeeeeeeeee ffffffffff g"
        let validation = nameValidatorUnderTest.validate(inputName: name)
        XCTAssertEqual(validation, REJECTED)
    }
    
    func test_shouldAccept_validName() {
        let name = "Mariana Ribeiro Meireles"
        let validation = nameValidatorUnderTest.validate(inputName: name)
        XCTAssertEqual(validation, ACCEPTED)
    }
    
    
}
