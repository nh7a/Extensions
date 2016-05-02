//
//  NSData.swift
//  Extensions
//
//  Created by Naoki Hiroshima on 5/29/15.
//  Copyright © 2015 WTFPL. All rights reserved.
//

import UIKit

extension NSData {
    convenience init(utf8: String) {
        self.init(data: utf8.dataUsingEncoding(NSUTF8StringEncoding)!)
    }
    
    convenience init(hex: String) {
        let data = NSMutableData()
        let arr = Array(hex.characters)
        for i in 0..<arr.count/2 {
            let c1 = arr[i*2+0]
            let c2 = arr[i*2+1]
            let byte = UInt8("\(c1)\(c2)", radix: 16)
            data.appendBytes([byte], length: 1)
        }
        self.init(data: data)
    }
    
    var hexString: String {
        return UnsafeBufferPointer<UInt8>(start: UnsafeMutablePointer<UInt8>(bytes), count: length).reduce("") {
            return $0 + String(format:"%02x", $1)
        }
    }
}
