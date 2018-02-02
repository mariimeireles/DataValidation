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
    
    let ACCEPTED = true
    let REJECTED = false
    var nameValidatorUnderTest: NameValidator!

    override func setUp() {
        super.setUp()
        nameValidatorUnderTest = NameValidator()
    }
    
    override func tearDown() {
        nameValidatorUnderTest = nil
        super.tearDown()
    }
    
    func test_shouldNotAccept_AnEmptyName() {
        let emptyName = ""
        let validation = nameValidatorUnderTest.validate(inputValue: emptyName)
        XCTAssertEqual(validation, REJECTED)
    }
    
    func testLessCharacters() {
        let name = "ana"
        let expected = nameValidatorUnderTest.validate(inputValue: name)
        XCTAssertFalse(expected)
    }
}
