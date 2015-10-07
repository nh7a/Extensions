//
//  UIImage.swift
//  Extensions
//
//  Created by Naoki Hiroshima on 6/5/15.
//  Copyright © 2015 WTFPL. All rights reserved.
//

import UIKit
import CoreGraphics

extension UIImage {
    func crop(targetSize: CGSize) -> UIImage {
        var rect = CGRectMake(0, 0, size.width, size.height)
        if size.width > targetSize.width {
            rect.origin.x = -floor((size.width - targetSize.width) / 2.0)
        }
        if size.height > targetSize.height {
            rect.origin.y = -floor((size.height - targetSize.height) / 2.0)
        }
        
        UIGraphicsBeginImageContextWithOptions(targetSize, true, scale)
        self.drawInRect(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func square() -> UIImage {
        let w = size.width
        let h = size.height
        if w < h {
            return crop(CGSizeMake(w, w))
        } else if (w > h) {
            return crop(CGSizeMake(h, h))
        } else {
            return self
        }
    }
    
    func resize(targetSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(targetSize, false, scale)
        self.drawInRect(CGRectMake(0, 0, targetSize.width, targetSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

extension UIImage {
    // correctionLevel can be L(7%), M(15%), Q(25%), or H(30%)
    convenience init?(qrcode: String, correctionLevel: String = "M", size: CGSize = CGSize(width: 100, height: 100)) {
        
        let filter = CIFilter(name: "CIQRCodeGenerator")!
        filter.setValue(correctionLevel, forKey: "inputCorrectionLevel")
        filter.setValue(qrcode.dataUsingEncoding(NSUTF8StringEncoding)!, forKey: "inputMessage")
        
        if let ciImage = filter.outputImage {
            var uiImage = UIImage(CIImage: ciImage, scale: 1.0, orientation: UIImageOrientation.Up)
            
            UIGraphicsBeginImageContext(size)
            let ctx = UIGraphicsGetCurrentContext()
            CGContextSetInterpolationQuality(ctx, .Default)
            uiImage.drawInRect(CGRectMake(0, 0, size.width, size.height))
            uiImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            self.init(CGImage: uiImage.CGImage!)
        } else {
            return nil
        }
    }
}
