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
        XCTAssertEqual(Foo.identifier, "Foo")
    }
    
    func testDequeue() {
        let tv = UITableView()
        tv.dataSource = self
        Foo.register(tableView: tv)
        let cell = Foo.dequeue(tableView: tv, forIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        
        XCTAssertTrue(cell is Foo)
        XCTAssertEqual(cell.tableView, tv)
    }
    
    // MARK: - UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
