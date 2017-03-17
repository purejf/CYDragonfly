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
            make.top.equalTo(img.snp.bottom)
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
        titleL.text = "这是一个有趣的话题"
        return titleL
    }()
    
    private lazy var countBtn: UIButton = {
        let countBtn = UIButton()
        self.addSubview(countBtn)
        countBtn.setTitleColor(UIColor.black, for: .normal)
        countBtn.setTitle("15万", for: .normal)
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
        img.backgroundColor = UIColor.lightGray
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
            itemV.backgroundColor = UIColor.brown
            itemV.tag = index + 1
            itemV.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(itemVTapGestHandle(tap:))))
            switch index {
            case 0:
                itemV.snp.makeConstraints({ (make) in
                    make.left.bottom.equalToSuperview()
                    make.top.equalTo(titleV.snp.bottom)
                    make.width.equalToSuperview().multipliedBy(1.0 / 3.0)
                })
            case 1:
                let preItemV = contentView.viewWithTag(index) as! CYFeaturedTopicItemView
                itemV.snp.makeConstraints({ (make) in
                    make.left.equalTo(preItemV.snp.right)
                    make.top.equalTo(titleV.snp.bottom)
                    make.bottom.equalToSuperview()
                    make.width.equalTo(preItemV)
                })
            case 2:
                let preItemV = contentView.viewWithTag(index) as! CYFeaturedTopicItemView
                itemV.snp.makeConstraints({ (make) in
                    make.left.equalTo(preItemV.snp.right)
                    make.bottom.right.equalToSuperview()
                    make.top.equalTo(titleV.snp.bottom)
                })
            default: break
            }
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
    
    private lazy var titleV: CYFeaturedTopicTitleView = {
        let titleV = CYFeaturedTopicTitleView()
        titleV.setupMoreItemClickHandle(handle: {
            self.gotoMore()
        })
        self.contentView.addSubview(titleV)
        titleV.backgroundColor = UIColor.red
        return titleV
    }()
}
