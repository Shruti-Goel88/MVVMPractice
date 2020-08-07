//
//  MVVMPracticeTests.swift
//  MVVMPracticeTests
//
//  Created by shruti Mittal on 7/13/20.
//  Copyright © 2020 shruti Mittal. All rights reserved.
//

import XCTest
@testable import MVVMPractice

class MVVMPracticeTests: XCTestCase {

    override func setUpWithError() throws {

        super.setUp()
        _ = MockConnectionClient().makeGetNetworkCall(urlString: Constants.stockUserApi , resultType : Stock.self) { (result) in
                   switch result {
                   case .failure(let error):
                       print(error)
                   case .success(let data):
                       let stockDetails = data
                       XCTAssert(stockDetails.users[0].displayName == "Brooklyn Huffman" , "true")
                   }
               }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
