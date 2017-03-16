//
//  CYFeaturedTopicCell.swift
//  Dragonfly
//
//  Created by Charles on 17/3/16.
//  Copyright © 2017年 cy. All rights reserved.
//

import UIKit

class CYFeaturedTopItemView: UIView {
    
    init(frame: CGRect) {
        super.init(frame: frame)
        // 添加子视图
        setup()
    }
    
    // 添加子视图
    private func setup() {
        
        // 图片
    }
    
    private lazy var titleL: UILabel = {
        let titleL = UILabel()
        self.addSubview(titleL)
        titleL.font = UIFont.systemFont(ofSize: 13)
        titleL.textColor = UIColor.black
        return titleL
    }()
    
    private lazy var countBtn: UIButton = {
        let countBtn = UIButton()
        self.addSubview(countBtn)
        countBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        return countBtn
    }()
    
    private lazy var alphaImg: UIImageView = {
        let alphaImg = UIImageView()
        self.addSubview(alphaImg)
        alphaImg.contentMode = .center
        return alphaImg
    }()
    
    private lazy var img: UIImageView = {
        let img = UIImageView()
        self.addSubview(img)
        img.contentMode = .center
        return img
    }()
}

class CYFeaturedTopicCell: UITableViewCell {
    
    init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 添加子视图
        setup()
    }
    
    // 添加子视图
    private func setup() {
        
        // 标题视图
        
        // items
        addItems()
    }
    
    private func addItems() {
        for index in 0...2 {
            let itemV = CYFeaturedTopItemView()
            self.contentView.addSubview(itemV)
            itemV.tag = index + 1
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let itemW: CGFloat = self.contentView.frame.size.width / 3.0
        for index in 0...2 {
            let itemV = self.contentView.viewWithTag(index + 1) as CYFeaturedTopItemView
            if let itemV = itemV {
                itemV.frame = CGRectMake(0, 30, itemW, self.contentView.frame.size.height - 30)
            }
        }
    }
    
    private lazy var titleV: CYFeatureTopicTitleView = {
        let titleV = CYFeatureTopicTitleView()
        self.contentView.addSubview(titleV)
        return titleV
    }()
}
