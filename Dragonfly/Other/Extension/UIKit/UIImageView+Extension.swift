//
//  UIImageView+Extension.swift
//  Dragonfly
//
//  Created by Charles on 2017/3/17.
//  Copyright © 2017年 cy. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func cy_setImage(name: String?) {
        if let name = name, name.characters.count > 0 {
            if name.hasPrefix("http") {
                setNetImage(urlString: name)
            } else {
                setLocalImage(name: name)
            }
        }
    }
    
    // 设置网络链接图片
    private func setNetImage(urlString: String) {
        kf.setImage(with: URL(string: urlString))
    }
    
    // 设置本地Asset图片
    private func setLocalImage(name: String) {
        image = UIImage(named: name)
    }
    
}
