//
//  UITableViewCell.swift
//  Extensions
//
//  Created by Naoki Hiroshima on 6/5/15.
//  Copyright © 2015 WTFPL. All rights reserved.
//

import UIKit

extension UITableViewCell {
    class var className: String {
        let s = NSStringFromClass(self)
        return s.componentsSeparatedByString(".").last as String!
    }
    
    class var reuseIdentifier: String {
        return className + UIApplication.sharedApplication().preferredContentSizeCategory
    }
    
    class func register(tableView tv: UITableView) {
        tv.registerClass(self, forCellReuseIdentifier: reuseIdentifier)
    }
    
    class func registerNib(tableView tv: UITableView) {
        let nib = UINib(nibName: className, bundle: nil)
        tv.registerNib(nib, forCellReuseIdentifier: reuseIdentifier)
    }
    
    class func dequeue(tableView tv: UITableView, forIndexPath indexPath: NSIndexPath) -> Self {
        let cell = tv.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
        return selfcast(cell)!
    }
}

extension UITableViewCell {
    var tableView: UITableView? {
        var table = superview
        while !(table is UITableView) && table != nil {
            table = table?.superview
        }
        return table as? UITableView
    }
}

private func selfcast<T>(obj: AnyObject) -> T? {
    return obj as? T
}
