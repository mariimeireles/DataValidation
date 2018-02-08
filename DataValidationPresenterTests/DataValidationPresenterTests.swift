//
//  DataValidationPresenterTests.swift
//  DataValidationPresenterTests
//
//  Created by Mariana Meireles | Stone on 2/7/18.
//  Copyright © 2018 Mariana Meireles | Stone. All rights reserved.
//

@testable import DataValidation
import XCTest

class DataValidationPresenterTests: XCTestCase {
    
    private let ACCEPTED = true
    private let REJECTED = false
    private var mock: DataValidationViewMock!
    private var presenter: DataValidationPresenter!
    private var nameValidator: NameValidator!
    private var emailValidator: EmailValidator!
    private var cpfValidator: CPFValidator!
    
    override func setUp() {
        super.setUp()
        mock = DataValidationViewMock()
        nameValidator = NameValidator()
        emailValidator = EmailValidator()
        cpfValidator = CPFValidator()
        presenter = DataValidationPresenter(
            view: mock,
            nameValidator: nameValidator,
            emailValidator: emailValidator,
            cpfValidator: cpfValidator
        )
    }
    
    override func tearDown() {
        mock = nil
        nameValidator = nil
        emailValidator = nil
        cpfValidator = nil
        presenter = nil
        super.tearDown()
    }
    
    func test_shouldntAccept_invalidName() {
        presenter.userNameChanged(name: "Ana")
        mock.onNameInvalid(state: .invalid)
    }
    
    func test_shouldAccept_validName() {
        presenter.userNameChanged(name: "Ana Soares")
        mock.onNameInvalid(state: .valid)
    }
    
    func test_shouldntAccept_invalidEmail() {
        presenter.userEmailChanged(email: "@gmail.com")
        mock.onEmailInvalid(state: .invalid)
    }
    
    func test_shouldAccept_validEmail() {
        presenter.userEmailChanged(email: "email@gmail.com")
        mock.onEmailInvalid(state: .valid)
    }
    
    func test_shouldntAccept_invalidCPF() {
        presenter.userCPFChanged(cpf: "13284434799")
        mock.onCPFInvalid(state: .invalid)
    }
    
    func test_shouldAccept_validCPF() {
        presenter.userCPFChanged(cpf: "14284434799")
        mock.onCPFInvalid(state: .valid)
    }
    
    func test_confirmButtonShouldntBeEnabled_WhenAllFieldsAreInvalid() {
        presenter.userNameChanged(name: "Ana")
        presenter.userCPFChanged(cpf: "13284434799")
        presenter.userEmailChanged(email: "@gmail.com")
        let validation = mock.isConfirmButtonEnabled
        XCTAssertEqual(validation, REJECTED)
    }
    
    func test_confirmButtonShouldBeEnabled_WhenAllFieldsAreValid() {
        presenter.userNameChanged(name: "Ana Soares")
        presenter.userCPFChanged(cpf: "14284434799")
        presenter.userEmailChanged(email: "email@gmail.com")
        let validation = mock.isConfirmButtonEnabled
        XCTAssertEqual(validation, ACCEPTED)
    }
}
