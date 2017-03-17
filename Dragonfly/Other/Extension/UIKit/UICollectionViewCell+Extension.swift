//
//  CYBaseCollectionViewCell.swift
//  Dragonfly
//
//  Created by Charles on 2017/3/17.
//  Copyright © 2017年 cy. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    
    class func cell(WithCollectionView col: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let reuseID = NSStringFromClass(classForCoder()) + "cellID"
        col.register(classForCoder(), forCellWithReuseIdentifier: reuseID)
        return col.dequeueReusableCell(withReuseIdentifier: reuseID, for: indexPath)
    }
    
    class func nibCell(WithCollectionView col: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        let selfStr = NSStringFromClass(classForCoder())
        let reuseId = selfStr + "cellID"
        let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let nibName = selfStr.replacingOccurrences(of: nameSpace, with: "").replacingOccurrences(of: ".", with: "")
        let nib = UINib(nibName: nibName, bundle: nil)
        col.register(nib, forCellWithReuseIdentifier: reuseId)
        return col.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath)
    }
}
