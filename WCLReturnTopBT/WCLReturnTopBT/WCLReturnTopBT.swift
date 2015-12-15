//
//  WCLReturnTopBT.swift
//  WCLReturnTopBT
//
//  Created by wcl on 15/7/25.
//  Copyright (c) 2015年 wcl. All rights reserved.
//

import UIKit

extension UIViewController{

    func addTopBtTo(tableView:UITableView) ->WCLTopBT{
        return self.addTopBT(15, bottom_edge: 15, tableView: tableView)
    }
    
    func addTopBT(right_edge:CGFloat,bottom_edge:CGFloat,tableView:UITableView) ->WCLTopBT{
        tableView.layoutIfNeeded()
        let topImage_Highlighted:UIImage = returnImage("返回顶部 点击")
        let topImage:UIImage = returnImage("返回顶部1未点击")
        let X = self.view.frame.size.width-(right_edge+topImage.size.width)
        let Y = self.view.frame.size.height-(bottom_edge+topImage.size.height)
        let topBT:WCLTopBT = WCLTopBT(frame:CGRectMake(X, Y, topImage.size.width, topImage.size.height), tableView: tableView)
        topBT.setImage(topImage, forState: UIControlState.Normal)
        topBT.setImage(topImage_Highlighted, forState: UIControlState.Highlighted)
        topBT.tag = 12345
        topBT.addTarget(self, action: Selector("return_to_top:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(topBT)
        return topBT
        }
    
    func returnImage(imageName:String)->UIImage{
        return UIImage(named: "WCLReturnTopBT.bundle/\(imageName)")!
    }
    
    func return_to_top(sender:WCLTopBT){
        if self.navigationController!.navigationBar.translucent {
            sender.tableView.setContentOffset(CGPointMake(0, -64), animated: true)
        }else
        {
            sender.tableView.setContentOffset(CGPointMake(0, 0), animated: true)
        }
    }
}

