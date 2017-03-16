//
//  UITableViewCell+Extension.swift
//  Dragonfly
//
//  Created by Charles on 17/3/16.
//  Copyright © 2017年 cy. All rights reserved.
//

import UIKit

extension UITableViewCell {
    public class func cell(WithTableView tableView: UITableView!) -> UITableViewCell.Type {
        let reuseId = NSStringFromClass(self) + "cellID"
        tableView.registerClass(self.classForCoder(), forCellReuseIdentifier: reuseId)
        return tableView.dequeueReusableCellWithIdentifier(reuseId) as! UITableViewCell.Type
    }
    
    public class func nibCell(WithTableView tableView: UITableView!) -> UITableViewCell.Type {
        let selfStr = NSStringFromClass(self.classForCoder()) as! String
        let reuseId = selfStr + "cellID"
        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        var nibName = selfStr.stringByReplacingOccurrencesOfString(nameSpace, withString: "") as! String
        let nib = UINib(nibName: nibName, bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: reuseId)
        return tableView.dequeueReusableCellWithIdentifier(reuseId) as! UITableViewCell.Type
    }
}