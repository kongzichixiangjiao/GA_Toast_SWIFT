//
//  GA_SubmitAlertView.swift
//  GA_Toast_SWIFT
//
//  Created by houjianan on 16/5/4.
//  Copyright © 2016年 houjianan. All rights reserved.
//


/**

let s = GA_SubmitAlertView(subView: self.view, submitType: .succeed)

s.hide()

*/

import UIKit

enum SubmitType {
    case succeed, fail
}

class GA_SubmitAlertView: UIView {
    
    let backColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
    let clearColor = UIColor.clearColor()
    let redColor = UIColor.redColor()
    let imageSucceed = UIImage(named: "提交成功提醒")
    let imageFail = UIImage(named: "提交失败提醒")
    let textSucced = "提交成功\n请静候消息"
    let textFail = "提交失败\n稍后再试"
    var submitType: SubmitType = .succeed
    func show(frame: CGRect, subView: UIView) {
        subView.addSubview(self)
        performSelector("hide", withObject: self, afterDelay: 1)
    }
    
    func hide() {
        remove()
    }
    
    func remove() {
        if self.alpha == 0 {return}
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.alpha = 0
            }) { (bo) -> Void in
                self.removeFromSuperview()
        }
    }
    
    convenience init(var frame: CGRect = CGRectMake(0, 0, 135, 135), subView: UIView, submitType: SubmitType = .succeed) {
        let w: CGFloat = 135
        let h: CGFloat = 135
        let x: CGFloat = subView.frame.width / 2 - w / 2
        let y: CGFloat = subView.frame.height / 2 - h / 2
        frame = CGRectMake(x, y, w, h)
        self.init(frame: frame)
        self.submitType = submitType
        show(frame, subView: subView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = clearColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func drawRect(rect: CGRect) {
        let x: CGFloat = 0
        let y: CGFloat = 0
        let w = rect.size.width
        let h = rect.size.height
        let r: CGFloat = 8
        let context = UIGraphicsGetCurrentContext()
        //画背景色
        CGContextBeginPath(context)
        CGContextMoveToPoint(context, r, y)
        CGContextAddLineToPoint(context, w - r, y)
        CGContextAddArcToPoint(context, w, y, w, r, r)
        CGContextAddLineToPoint(context, w, h - r)
        CGContextAddArcToPoint(context, w, h, w - r, h, r)
        CGContextAddLineToPoint(context, r, h)
        CGContextAddArcToPoint(context, x, h, x, h - r, r)
        CGContextAddLineToPoint(context, x, r)
        CGContextAddArcToPoint(context, x, y, r, y, r)
        CGContextClosePath(context)
        CGContextSetFillColorWithColor(context, backColor.CGColor)
        CGContextFillPath(context)
        
        var text = ""
        var image = UIImage()
        if self.submitType == .succeed {
            text = textSucced
            image = imageSucceed!
        } else {
            text = textFail
            image = imageFail!
        }
        //画文字
        //翻转当前的坐标系（因为对于底层绘制引擎来说，屏幕左下角为（0，0））
        CGContextSetTextMatrix(context, CGAffineTransformIdentity)
        CGContextTranslateCTM(context, 0, self.bounds.size.height)
        CGContextScaleCTM(context, 1.0, -1.0)
        let path = CGPathCreateMutable();
        //设置path点的时候屏幕左下角为（0，0）即使上面翻转过。
        CGPathMoveToPoint(path, nil, 0, 0)
        CGPathAddLineToPoint(path, nil, 0, h / 2.5)
        CGPathAddLineToPoint(path, nil, w , h / 2.5)
        CGPathAddLineToPoint(path, nil, w, 0)
        CGPathCloseSubpath(path)
        let attrString = NSMutableAttributedString(string: text)
        attrString.addAttribute(NSFontAttributeName, value: UIFont.systemFontOfSize(12), range: NSMakeRange(0, attrString.length))
        attrString.addAttribute(NSForegroundColorAttributeName, value: UIColor.whiteColor(), range: NSMakeRange(0, attrString.length))
        let style                 = NSMutableParagraphStyle()
        style.lineSpacing         = 5.0 //每行文字之间的距离
        style.paragraphSpacing    = 0.0 //段落之间的距离
        style.headIndent          = 0.0 //每一行前面缩进的距离
        style.firstLineHeadIndent = 0.0 //每段开头缩进
        style.alignment           = .Center
        attrString.addAttribute(NSParagraphStyleAttributeName, value: style, range: NSMakeRange(0, text.characters.count))
        let frameSetter = CTFramesetterCreateWithAttributedString(attrString as CFAttributedString)
        let frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, text.characters.count), path, nil)
        CTFrameDraw(frame, context!)
        
        //画图
        let iW: CGFloat = image.size.width / 2
        let iH: CGFloat = image.size.height / 2
        let iX: CGFloat = w / 2 - iW / 2
        let iY: CGFloat = 60
        
        let iRect = CGRectMake(iX, iY, iW, iH)
        //画字翻转过了
        //        CGContextTranslateCTM(context, 0, iRect.height)
        //        CGContextScaleCTM(context, 1, -1)
        CGContextDrawImage(context, iRect, image.CGImage)
    }
}
