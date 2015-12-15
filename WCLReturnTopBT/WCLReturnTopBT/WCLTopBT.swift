//
//  WCLTopBT.swift
//  WCLReturnTopBT
//
//  Created by wcl on 15/7/25.
//  Copyright (c) 2015年 wcl. All rights reserved.
//

import UIKit

class WCLTopBT: UIButton {
    
    var tableView: UITableView
    
    deinit{
        self.tableView.removeObserver(self, forKeyPath: "contentOffset")
    }
    
    init(frame: CGRect,tableView:UITableView) {
        self.tableView = tableView
        super.init(frame: frame)
        tableView.addObserver(self, forKeyPath: "contentOffset", options: NSKeyValueObservingOptions.New, context: nil)
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        let offSet:NSValue = change!["new"] as! NSValue
        let offSetY:CGFloat = offSet.CGPointValue().y
        if (offSetY+tableView.contentInset.top) > self.tableView.frame.size.height {
            if self.superview?.subviews.last as! WCLTopBT != self{
                self.superview?.bringSubviewToFront(self)
            }
            self.alpha = 1
        }else
        {
            self.alpha = 0
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
