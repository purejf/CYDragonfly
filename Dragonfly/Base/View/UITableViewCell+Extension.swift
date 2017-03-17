//
//  UITableViewCell+Extension.swift
//  Dragonfly
//
//  Created by Charles on 17/3/16.
//  Copyright © 2017年 cy. All rights reserved.
//

import UIKit

extension UITableViewCell {
    public class func cell(WithTableView tableView: UITableView!) -> UITableViewCell {
        let reuseId = NSStringFromClass(self) + "cellID"
        tableView.register(classForCoder(), forCellReuseIdentifier: reuseId)
        return tableView.dequeueReusableCell(withIdentifier: reuseId)!
    }
    
    public class func nibCell(WithTableView tableView: UITableView!) -> UITableViewCell {
        let selfStr = NSStringFromClass(classForCoder()) 
        let reuseId = selfStr + "cellID"
        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let nibName = selfStr.replacingOccurrences(of: nameSpace, with: "").replacingOccurrences(of: ".", with: "")
        let nib = UINib(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: reuseId)
        return tableView.dequeueReusableCell(withIdentifier: reuseId)!
    }
}
