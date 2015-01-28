//
//  OperatorsTests.swift
//  FuncSwift
//
//  Created by Naphat Sanguansin on 1/28/15.
//  Copyright (c) 2015 Naphat Sanguansin. All rights reserved.
//

import UIKit
import XCTest
import FuncSwift

class OperatorsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test() {
        // This is an example of a functional test case.
        func f(b: Int) -> Bool {
            if b == 0 {
                return true
            } else {
                return false
            }
        }
        func g(b: Bool) -> Int {
            if b {
                return 0
            } else {
                return 1
            }
        }
        XCTAssert(0 |> f, "Single pipeline works")
        XCTAssert((0 |> f |> g) == 0, "Chained pipelines work")
        XCTAssert((0 |> f |> g) == ((f <> g)(0)), "Function composition works")
    }
}
