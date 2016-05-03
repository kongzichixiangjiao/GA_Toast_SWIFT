//
//  ViewController.swift
//  GA_Toast_SWIFT
//
//  Created by houjianan on 16/4/20.
//  Copyright © 2016年 houjianan. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBAction func action(sender: GA_WarnButton) {
        sender.isWarn = !sender.isWarn
        sender.setNeedsDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let b = GA_WarnButton(frame: CGRectMake(100, 100, 100, 100))
        b.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(b)
        
        //        self.view.makeToast("请求数据失败")
        //        self.view.makeToast("请求数据失败", duration: 122, position: CSToastPositionCenter)
        //        self.view.makeToastActivity(CSToastPositionCenter)
        
        // create a new style
        //        let style = CSToastStyle(defaultStyle: ())
        //
        //        style.messageColor = UIColor.orangeColor()
        //        self.view.makeToast("This is a piece of toast", duration: 24, position: CSToastPositionBottom, style: style)
        //        CSToastManager.setSharedStyle(style)
        //        CSToastManager.setTapToDismissEnabled(false)
        //        CSToastManager.setQueueEnabled(true)
        
//        let v = UIView()
//        v.frame = CGRectMake(0, 0, 50, 50)
//        v.backgroundColor = UIColor.orangeColor()
//        self.view.showToast(v)
//        
//        let style = CSToastStyle(defaultStyle: ())
//        style.titleFont = UIFont.systemFontOfSize(12)
//        style.titleColor = UIColor.blueColor()
//        self.view.makeToast("图片", duration: 5, position: CSToastPositionCenter, title: "驴", image: UIImage(named: "8.jpg"), style: style) { (bo) -> Void in
//            print("2")
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

