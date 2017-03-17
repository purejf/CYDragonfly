//
//  UIView+Nib.swift
//  Dragonfly
//
//  Created by Charles on 2017/3/17.
//  Copyright © 2017年 cy. All rights reserved.
//

import UIKit

extension UIView {
    
    // 类方法： 加载从xib中创建的视图
    class func fromNib() -> UIView {
        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let name = NSStringFromClass(self.classForCoder()).replacingOccurrences(of: nameSpace, with: "").replacingOccurrences(of: ".", with: "")
        return Bundle.main.loadNibNamed(name, owner: nil, options: nil)?.first as! UIView
    }

}
