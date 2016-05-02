//
//  UIColor.swift
//  Extensions
//
//  Created by Naoki Hiroshima on 7/16/14.
//  Copyright © 2015 WTFPL. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(rgb: UInt, alpha: CGFloat = 1.0) {
        let r = CGFloat((rgb >> 16) & 0xff) / 0xff
        let g = CGFloat((rgb >>  8) & 0xff) / 0xff
        let b = CGFloat((rgb >>  0) & 0xff) / 0xff
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    
    convenience init(rgba: UInt) {
        let rgb = rgba >> 8
        let a = CGFloat(rgba & 0xff) / 0xff
        self.init(rgb: rgb, alpha: a)
    }
}

extension UIColor {
    
    func lighten(multiplier: CGFloat = 1.3) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        if getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            return UIColor(hue: h, saturation: s, brightness: min(1.0, b * multiplier), alpha: a)
        } else {
            return self
        }
    }
    
    func darken() -> UIColor { return lighten(0.75) }
    
    func saturate(multiplier: CGFloat = 1.3) -> UIColor {
        var h:CGFloat = 0, s:CGFloat = 0, b:CGFloat = 0, a:CGFloat = 0
        if getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            return UIColor(hue: h, saturation: min(1.0, s * multiplier), brightness: b, alpha: a)
        } else {
            return self
        }
    }
    
    func translucent(multiplier: CGFloat = 0.5) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        if getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            return UIColor(hue: h, saturation: s, brightness: b, alpha: min(1.0, a * multiplier))
        } else {
            return self
        }
    }
}
