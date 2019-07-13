//
//  TestEmpolyeeVM.swift
//  SimpleMvvMDemoTests
//
//  Created by User on 7/12/19.
//  Copyright © 2019 User. All rights reserved.
//

import Foundation
import XCTest
@testable import SimpleMvvMDemo

class TestEmpolyeeVM :XCTestCase
{
    
    // This class is created to test two methods in EmployeeViewModel class
    
     let EmpolyeeVM1 = EmpolyeeViewModel()
    
    func testGetimage()
    {
        let ex = expectation(description: "Expecting image to be downloaded ")
        let dummyurl = "https://dummyimage.com/200x100/a1a63c/0826d1.png"
        
       
        EmpolyeeVM1.getImage(url: dummyurl) { (err, image) in
            XCTAssertNil(err)
            XCTAssertNotNil(image)
            ex.fulfill()
        }
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
        
    }
    
    
    func testGetEmployeesData()
    {
        let ex = expectation(description: "Expecting a JSON data not nil")
        
       // let EmpolyeeVM1 = EmpolyeeViewModel()
        EmpolyeeVM1.getEmployeesData(){(error, result) in
            
            XCTAssertNil(error)
            XCTAssertNotNil(result)
            ex.fulfill()
            
        }
       
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }
   
}
