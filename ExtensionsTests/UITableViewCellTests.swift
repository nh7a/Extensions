//
//  UITableViewCellTests.swift
//  Extensions
//
//  Created by Naoki Hiroshima on 10/7/15.
//  Copyright © 2015 WTFPL. All rights reserved.
//

import XCTest
@testable import Extensions

class Foo : UITableViewCell {}
class Bar : UITableViewCell {}

class UITableViewCellTests: XCTestCase, UITableViewDataSource {
    
    func testIdentifier() {
        XCTAssertEqual(Foo.className, "Foo")
    }
    
    func testDequeue() {
        let tv = UITableView()
        tv.dataSource = self
        Foo.register(tableView: tv)
        Bar.register(tableView: tv)
        
        let foo = Foo.dequeue(tableView: tv, forIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        XCTAssertTrue(foo.dynamicType == Foo.self)
        XCTAssertEqual(foo.tableView, tv)
        
        let bar = Bar.dequeue(tableView: tv, forIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        XCTAssertTrue(bar.dynamicType == Bar.self)
        XCTAssertEqual(bar.tableView, tv)
    }
    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
