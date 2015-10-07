//
//  String.swift
//  Extensions
//
//  Created by Naoki Hiroshima on 5/29/15.
//  Copyright © 2015 WTFPL. All rights reserved.
//

import UIKit

extension String {
    func trim() -> String {
        return stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
    
    func replace(string: String, withString replacement: String, options: NSStringCompareOptions = .LiteralSearch) -> String {
        return stringByReplacingOccurrencesOfString(string, withString: replacement, options: options)
    }
}