//
//  NSError.swift
//  Extensions
//
//  Created by Naoki Hiroshima on 6/5/15.
//  Copyright © 2015 WTFPL. All rights reserved.
//

import UIKit

extension NSError {
    convenience init(string: String, code: Int = -9999) {
        let dict = [ NSLocalizedDescriptionKey : string ]
        let domain = NSBundle.mainBundle().infoDictionary?["CFBundleIdentifier"] as! String
        self.init(domain: domain, code: code, userInfo: dict)
    }
}
