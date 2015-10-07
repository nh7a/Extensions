//
//  NSNotificationCenter.swift
//  Extensions
//
//  Created by Naoki Hiroshima on 5/29/15.
//  Copyright © 2015 WTFPL. All rights reserved.
//

import UIKit

extension NSNotificationCenter {
    class func addObserver(observer: AnyObject, selector aSelector: Selector, name aName: String) {
        NSNotificationCenter.defaultCenter().addObserver(observer, selector: aSelector, name: aName, object: nil)
    }
    
    class func postNotificationName(aName: String, object anObject: AnyObject?) {
        NSNotificationCenter.defaultCenter().postNotificationName(aName, object: anObject)
    }
    
    class func removeObserver(observer: AnyObject) {
        NSNotificationCenter.defaultCenter().removeObserver(observer)
    }
}
