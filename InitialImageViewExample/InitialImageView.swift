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
    
    func setImageWithName(name: String, backgroundColor: UIColor, circle: Bool) {
        self.setImageWithInitial(getInitialFromName(name), backgroundColor: backgroundColor, circle: circle)
    }
    
    func setImageWithInitial(initial: String, backgroundColor: UIColor, circle: Bool) {
        let attributedInitial = NSAttributedString(string: initial, attributes: createFontAttribute())
        
        self.image = createImageFromInitial(attributedInitial, backgroundColor: backgroundColor, circle: true)
    }
    
    // MARK: - Helpers
    func getInitialFromName(name: String) -> String {
        
        let fullName = name.componentsSeparatedByString(" ")
        var initial = ""
        
        if let firstChar = fullName[safe: 0]?.characters.first {
            initial.append(firstChar)
        }
        if let secondChar = fullName[safe: 1]?.characters.first {
            initial.append(secondChar)
        }
        
        return initial
        
    }
    
    func createFontAttribute() -> [String: AnyObject] {
        
        let fontSize = CGRectGetWidth(self.bounds) * fontResizeValue;
        let fontAttribute:[String:AnyObject] = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: font.fontWithSize(fontSize)]
        return fontAttribute
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

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
