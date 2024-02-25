//
//  RegistrationViewTests.swift
//  GetThingsDoneTests
//
//  Created by Igor Łopatka on 06/12/2023.
//

//import XCTest
//@testable import GetThingsDone
//
//
//final class RegistrationViewTests: XCTestCase {
//
//    var registrationView: RegistrationView!
//
//    
//    override func setUpWithError() throws {
//        registrationView = RegistrationView()
//    }
//
//    override func tearDownWithError() throws {
//        registrationView = nil
//                super.tearDown()
//    }
//    
//    func testTextFieldInput() throws {
//        registrationView.username = "TestUser"
//        registrationView.password = "TestPass"
//        
//        XCTAssertEqual(registrationView.username, "TestUser")
//        XCTAssertEqual(registrationView.password, "TestPass")
//    }
//    
//    func testValidationLogic() {
//        // Test various combinations of username and password
//        registrationView.username = "User"
//        registrationView.password = "Pass"
//        XCTAssertFalse(registrationView.isValid)
//        
//        registrationView.username = "User"
//        registrationView.password = "Password"
//        XCTAssertTrue(registrationView.isValid)
//        
//        // Add more combinations as needed
//    }
//    
//    func testButtonState() {
//        registrationView.username = "User"
//        registrationView.password = "Pass"
//        XCTAssertFalse(registrationView.isValid)
//        
//        registrationView.username = "User"
//        registrationView.password = "Password"
//        XCTAssertTrue(registrationView.isValid)
//        
//        // The actual button state test might depend on how you implement the UI
//        // and might not be directly testable in some SwiftUI scenarios.
//        // If possible, check if the button's disabled property matches the isValid state
//    }
//}
