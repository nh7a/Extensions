//
//  UITableViewCell.swift
//  Extensions
//
//  Created by Naoki Hiroshima on 6/5/15.
//  Copyright © 2015 WTFPL. All rights reserved.
//

import UIKit

extension UITableViewCell {
    class var identifier: String {
        let s = NSStringFromClass(self)
        return s.componentsSeparatedByString(".").last as String!
    }
    
    class func register(tableView tv: UITableView) {
        tv.registerClass(self, forCellReuseIdentifier: self.identifier)
    }
    
    class func registerNib(tableView tv: UITableView) {
        let nib = UINib(nibName: self.identifier, bundle: nil)
        tv.registerNib(nib, forCellReuseIdentifier: self.identifier)
    }
    
    class func dequeue(tableView tv: UITableView, forIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return tv.dequeueReusableCellWithIdentifier(self.identifier, forIndexPath: indexPath)
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
