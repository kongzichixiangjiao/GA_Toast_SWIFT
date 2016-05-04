//
//  GA_WaitingView.swift
//  GA_WaitingView
//
//  Created by houjianan on 16/1/18.
//  Copyright © 2016年 houjianan. All rights reserved.
//

/*
GA_NetWorkAlertView.share().show(self.view, message: "网络不稳定", delayAutoHidenDuration: 4)
GA_LocationAlertView.share().show(self.view, delayAutoHidenDuration: 2)
*/

import UIKit

class GA_WaitingView: UIView {
    
    var title: String?
    var subTitle: String?
    var message: String?
    var autoHiden: Bool = false
    var delayAutoHidenDuration: NSTimeInterval?
    var views: [UIView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func show(contentView: UIView, message: String = "", autoHiden: Bool = true, delayAutoHidenDuration: NSTimeInterval = 30, handler: () -> ()) {
        self.userInteractionEnabled = true
        
        self.backgroundColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 0.4)
        
        if views.count > 0 {
            views.removeAll()
        }
        
        print("father - show")
    }
    
    func hide() {
        print("father - hide")
    }
    
    func removeViews() {
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            for view in self.views {
                view.alpha = 0.3
                view.transform = CGAffineTransformMakeScale(0.4, 0.4);
            }
            }) {
            [weak self] completion in
            if completion {
                if let weakSelf = self {
                    for view in weakSelf.views {
                        view.removeFromSuperview()
                    }
                    self?.removeFromSuperview()
                }
            }
        }
    }
    
}
