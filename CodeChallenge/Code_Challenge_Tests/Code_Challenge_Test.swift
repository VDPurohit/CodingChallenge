//
//  Code_Challenge_Test.swift
//  Code_Challenge_Tests
//
//  Created by Admin on 01.04.21.
//

import XCTest
@testable import CodeChallenge

class Code_Challenge_Test: XCTestCase {
    
    var cityViewModel : CityViewModel!
    
    override func setUp() {
        super.setUp()
        cityViewModel = CityViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        cityViewModel = nil
    }
    
    //Testcase1:- Passing with out any filter check weather we the data or not. It means it load all data.
    func test_without_filter() {
        self.cityViewModel.applyFilter("") { (isSuccess) in
            
            XCTAssertTrue(isSuccess)
            XCTAssertNotEqual(0, self.cityViewModel.bindFilterArray.count)
            XCTAssertEqual(209557, self.cityViewModel.bindFilterArray.count)
        }
    }
    
    //Testcase2:- Passing with "Aa" filter check weather we the data or not. It means that it load appropriate data only.
    func test_with_two_letter_valid_filter() {
        self.cityViewModel.applyFilter("Aa") { (isSuccess) in
            
            XCTAssertTrue(isSuccess)
            XCTAssertNotEqual(0, self.cityViewModel.bindFilterArray.count)
            XCTAssertEqual(42, self.cityViewModel.bindFilterArray.count)
        }
    }
    
    //Testcase3:- Passing with invalid filter("Aaaaa") check weather we the data or not. which is not return any data.
    func test_withtwoletter_valid_filter() {
        self.cityViewModel.applyFilter("Aaaaa") { (isSuccess) in
            
            XCTAssertFalse(isSuccess)
            XCTAssertEqual(0, self.cityViewModel.bindFilterArray.count)
        }
    }
}
