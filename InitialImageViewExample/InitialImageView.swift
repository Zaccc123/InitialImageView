//
//  InitialImageView.swift
//  InitialImageViewExample
//
//  Created by Zac on 21/5/16.
//  Copyright © 2016 Zac. All rights reserved.
//

import UIKit

class InitialImageView : UIImageView {
    
    var fontResizeValue:CGFloat = 0.5
    var font = UIFont.systemFontOfSize(20)
    
    func setImageWithInitial(initial: String, backgroundColor: UIColor, circle: Bool) {
        self.setImageWithInitial(initial, fontAttribute: createFontAttributeWith(nil), backgroundColor: backgroundColor, circle: circle)
    }

    func setImageWithInitial(initial: String, fontAttribute: [String : AnyObject]?, backgroundColor: UIColor, circle: Bool) {
        let attributedInitial = NSAttributedString(string: initial, attributes: fontAttribute)
        
        self.image = createImageFromInitial(attributedInitial, backgroundColor: backgroundColor, circle: true)
    }
    
    // MARK: - Helpers
    private func createFontAttributeWith(fontName: String?) -> [String: AnyObject] {
        
        let fontSize = CGRectGetWidth(self.bounds) * fontResizeValue;
        
        if let fontName = fontName {
            let fontAttribute:[String:AnyObject] = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont(name: fontName, size: fontSize)!]
            return fontAttribute
        }
        else {
            let fontAttribute:[String:AnyObject] = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: font.fontWithSize(fontSize)]
            return fontAttribute
        }
        
    }
    
    private func createImageFromInitial(attributedInitial: NSAttributedString, backgroundColor: UIColor, circle: Bool) -> UIImage {
        
        let scale = UIScreen.mainScreen().scale
        let bounds = self.bounds
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, scale)
        let context = UIGraphicsGetCurrentContext()
        
        if (circle) {
            let path = CGPathCreateWithEllipseInRect(self.bounds, nil);
            CGContextAddPath(context, path)
            CGContextClip(context)
        }
        
        CGContextSetFillColorWithColor(context, backgroundColor.CGColor)
        CGContextFillRect(context, CGRectMake(0, 0, bounds.size.width, bounds.size.height))
        
        let textSize = attributedInitial.size()
        let rect = CGRect(x: bounds.size.width/2 - textSize.width/2, y: bounds.size.height/2 - textSize.height/2, width: textSize.width, height: textSize.height)
        
        attributedInitial.drawInRect(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return image;

    }

}
