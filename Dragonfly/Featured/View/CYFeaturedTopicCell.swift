//
//  CYFeaturedTopicCell.swift
//  Dragonfly
//
//  Created by Charles on 17/3/16.
//  Copyright © 2017年 cy. All rights reserved.
//

import UIKit

// 主题item视图
class CYFeaturedTopicItemView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 添加子视图
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 添加子视图
    private func setup() {
        
        // 图片
        img.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.75)
        }
        
        // 标题
        titleL.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(img.snp.top)
        }
        
        // 虚色背景
        alphaImg.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalTo(20)
            make.bottom.equalTo(img)
        }
        
        // 播放数量
        countBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.bottom.equalTo(alphaImg)
        }
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
        countBtn.setTitleColor(UIColor.white, for: .normal)
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

// 主题cell
class CYFeaturedTopicCell: UITableViewCell {
    
    typealias CYFeaturedTopicCellMoreItemClickHandle = () -> Void
    
    typealias CYFeaturedTopicCellTopicItemClickHandle = (_ index: Int) -> Void
    
    private var moreItemClickHandle: CYFeaturedTopicCellMoreItemClickHandle?
    
    private var topicItemClickHandle: CYFeaturedTopicCellTopicItemClickHandle?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 添加子视图
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupMoreItemClickHandle(handle: @escaping CYFeaturedTopicCellMoreItemClickHandle) {
        moreItemClickHandle = handle
    }
    
    func setupTopicItemClickHandle(handle: @escaping CYFeaturedTopicCellTopicItemClickHandle) {
        topicItemClickHandle = handle
    }
    
    // 添加子视图
    private func setup() {
        
        // 标题视图
        titleV.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(30)
        }
        
        // 添加主题视图
        setupItems()
    }
    
    // 添加主题视图
    private func setupItems() {
        for index in 0...2 {
            let itemV = CYFeaturedTopicItemView()
            contentView.addSubview(itemV)
            itemV.tag = index + 1
            itemV.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(itemVTapGestHandle(tap:))))
        }
    }
    
    // 主题视图点击
    @objc private func itemVTapGestHandle(tap: UITapGestureRecognizer) {
        if let handle = topicItemClickHandle {
            let itemV = tap.view as! CYFeaturedTopicItemView
            let index = itemV.tag - 1
            handle(index)
        }
    }
    
    // 查看更多
    private func gotoMore() {
        if let handle = moreItemClickHandle {
            handle()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let itemW: CGFloat = contentView.frame.size.width / 3.0
        for index in 0...2 {
            let itemV = contentView.viewWithTag(index + 1) as! CYFeaturedTopicItemView
            itemV.frame = CGRect(x: 0, y: 30, width: itemW, height: contentView.frame.size.height - 30)
        }
    }
    
    private lazy var titleV: CYFeatureTopicTitleView = {
        let titleV = CYFeatureTopicTitleView()
        titleV.setupMoreItemClickHandle(handle: { 
            self.gotoMore()
        })
       self.contentView.addSubview(titleV)
        return titleV
    }()
}
