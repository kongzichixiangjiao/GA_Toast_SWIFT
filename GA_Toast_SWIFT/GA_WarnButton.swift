//
//  GA_WarnButton.swift
//  GA_Toast_SWIFT
//
//  Created by houjianan on 16/5/3.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit

class GA_WarnButton: UIButton {
    
    @IBInspectable var warnColor: UIColor = UIColor.orangeColor()
    @IBInspectable var image: UIImage = UIImage(named: "设置")!
    @IBInspectable var imageColor: UIColor = UIColor.clearColor()
    @IBInspectable var title: NSString = "设置"
    @IBInspectable var titleColor: UIColor = UIColor.orangeColor()
    @IBInspectable var fontSize: CGFloat = 12
    @IBInspectable var spaceSize: CGFloat = 6
    @IBInspectable var warnSize: CGFloat = 6
    @IBInspectable var isWarn: Bool = true
    @IBInspectable var isLeft: Bool = true
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.blueColor()
    }
    
    override func drawRect(rect: CGRect) {
    
        let w = rect.size.width
        let h = rect.size.height
        
        let iW: CGFloat = 20
        let iH: CGFloat = 20
        
        let tH: CGFloat = 15
        var iRect: CGRect!
        if isLeft {
            iRect = CGRectMake(10, h / 2 - iH / 2, iW, iH)
        } else {
            iRect = CGRectMake(w / 2 - iW / 2, h / 2 - iH / 2, iW, iH)
        }
        let tRect: CGRect = CGRectMake(CGRectGetMaxX(iRect) + spaceSize, h / 2 - tH / 2, 30, tH)
        let eRect: CGRect = CGRectMake(CGRectGetMaxX(tRect), CGRectGetMinY(tRect), warnSize, warnSize)
        //画字
        title.drawInRect(tRect, withAttributes: [NSFontAttributeName : UIFont.systemFontOfSize(fontSize), NSForegroundColorAttributeName : titleColor])
        
        //画提醒圆点
        let context = UIGraphicsGetCurrentContext()
        CGContextBeginPath(context)
        CGContextAddEllipseInRect(context, eRect)
        if isWarn {
            CGContextSetFillColorWithColor(context, warnColor.CGColor)
        } else {
            CGContextSetFillColorWithColor(context, UIColor.clearColor().CGColor)
        }
        CGContextDrawPath(context, .Fill)//绘制填充
        /**
        *  画图片
        */
        
    }
    
}
