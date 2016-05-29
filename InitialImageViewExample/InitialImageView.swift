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
    var font = UIFont.systemFontOfSize(20)  //font size does not matter, it will be calculated by the base on fontResizeValue and self.bounds
    var isCircle = true

    func setImageWithFirstName(firstName: String, lastName: String, backgroundColor: UIColor = UIColor.darkGrayColor(), randomColor: Bool = false) {
        self.setImageWithInitial(getInitialFromName("\(firstName) \(lastName)"), backgroundColor: backgroundColor, randomColor: randomColor)
    }
    
    func setImageWithName(name: String, backgroundColor: UIColor = UIColor.darkGrayColor(), randomColor: Bool = false) {
        self.setImageWithInitial(getInitialFromName(name), backgroundColor: backgroundColor, randomColor: randomColor)
    }
    
    func setImageWithInitial(initial: String, backgroundColor: UIColor = UIColor.darkGrayColor(), randomColor: Bool = false) {
        let attributedInitial = NSAttributedString(string: initial, attributes: createFontAttribute())

        if randomColor {
            let bgColor = UIColor.randomNonNearWhiteColor()
            self.image = createImageFromInitial(attributedInitial, backgroundColor: bgColor)

            if backgroundColor != UIColor.darkGrayColor() {
                print("Warning: backgroundColor parameters will be ignored if randomColor is set to true")
            }
        } else {
            self.image = createImageFromInitial(attributedInitial, backgroundColor: backgroundColor)
        }
    }
    
    // MARK: - Helpers
    func getInitialFromName(name: String) -> String {
        let fullName = name.componentsSeparatedByString(" ")
        var initial = String()
        
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
    
    private func createImageFromInitial(attributedInitial: NSAttributedString, backgroundColor: UIColor) -> UIImage {
        let scale = UIScreen.mainScreen().scale
        let bounds = self.bounds
        
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, scale)
        let context = UIGraphicsGetCurrentContext()
        
        if (isCircle) {
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

extension UIColor {
    static func randomNonNearWhiteColor() -> UIColor {
        //upper bounds is set to 215 to prevent color that is "near" white which result in no differences between initial and bg color
        let red = CGFloat(arc4random_uniform(215)) / 255
        let green = CGFloat(arc4random_uniform(215)) / 255
        let blue = CGFloat(arc4random_uniform(215)) / 255

        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
