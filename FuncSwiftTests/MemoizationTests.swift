//
//  MemoizationTests.swift
//  FuncSwift
//
//  Created by Naphat Sanguansin on 1/28/15.
//  Copyright (c) 2015 Naphat Sanguansin. All rights reserved.
//

import UIKit
import XCTest
import FuncSwift

class MemoizationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFib() {
        var count = 0
        let fib = memoize { (fib: Int->Int) in
            { (n:Int) -> Int in
                count++
                assert(n >= 0)
                if n == 0 {
                    return 0
                } else if n == 1 || n == 2 {
                    return 1
                }
                return fib(n-1) + fib(n-2)
            }
        }
        XCTAssert(fib(5) == 5, "fib(5) should be 5")
        let oldCount = count
        for i in 1...5 {
            fib(i)
            XCTAssert(oldCount == count, "Count stays constant at \(count). oldCount is \(oldCount)")
        }
    }
}
