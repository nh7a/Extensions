//
//  StringTests.swift
//  Extensions
//
//  Created by Naoki Hiroshima on 10/7/15.
//  Copyright © 2015 WTFPL. All rights reserved.
//

import XCTest
@testable import Extensions

class StringTests: XCTestCase {
    
    func testTrim() {
        let s = "  foo bar  "
        XCTAssertEqual(s.trim(), "foo bar")
    }
    
    func testReplace() {
        let s = "foo bar"
        XCTAssertEqual(s.replace("bar", withString: "hoge"), "foo hoge")
        XCTAssertEqual(s.replace("Bar", withString: "hoge"), "foo bar")
        XCTAssertEqual(s.replace("Bar", withString: "hoge", options: .CaseInsensitiveSearch), "foo hoge")
    }
    
}
