//
//  NSDataTests.swift
//  Extensions
//
//  Created by Naoki Hiroshima on 10/7/15.
//  Copyright © 2015 WTFPL. All rights reserved.
//

import XCTest
@testable import Extensions

class NSDataTests: XCTestCase {
    
    func testHex() {
        XCTAssertEqual(NSData(hex: "deadbeef").hexString, "deadbeef")
        XCTAssertEqual(NSData(hex: "DeadBeaf").hexString, "deadbeaf")
    }
}
