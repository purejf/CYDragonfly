//
//  CYFeaturedHeaderView.swift
//  Dragonfly
//
//  Created by Charles on 2017/3/16.
//  Copyright © 2017年 cy. All rights reserved.
//

import UIKit

class CYFeaturedItemView: UIView {
    
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
        
        backgroundColor = UIColor.green
        
        // 图片
        img.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(0)
            make.height.equalToSuperview().multipliedBy(0.66)
        }
        
        // 标题
        titleL.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(img.snp.bottom)
        }
    }
    
    var title: String?  {
        didSet {
            if let vTitle = title {
                titleL.text = vTitle
            }
        }
    }
    
    var image: String? {
        didSet {
            if let vImg = image {
                img.image = UIImage(named: vImg)
            }
        }
    }
    
    private lazy var titleL: UILabel = {
        let titleL = UILabel()
        self.addSubview(titleL)
        titleL.font = UIFont.systemFont(ofSize: 13)
        titleL.textColor = UIColor.black
        titleL.textAlignment = .center
        return titleL
    }()
    
    private lazy var img: UIImageView = {
        let img = UIImageView()
        self.addSubview(img)
        img.backgroundColor = UIColor.lightGray
        img.contentMode = .center
        return img
    }()
}


/// 底部选项 
enum CYFeaturedHeaderBottomItemType: Int {
    case Rank = 0
    case Featured
    case Novel
    case Live
    case Mall
}

class CYFeaturedHeaderView: UIView {
    
    typealias CYFeaturedBottomItemClickHandle = (_ type: CYFeaturedHeaderBottomItemType) -> Void
    
    typealias CYFeaturedBannerItemClickHandle = (_ index: Int) -> Void
    
    var urls: [String]? {
        didSet {
            carouselV.urls = urls
        }
    }
    
    private let titles = {
        return ["人气榜单",
                "付费精品",
                "畅销小说",
                "直播专区",
                "蜻蜓商城"]
    }()
    
    private let images = {
        return ["人气榜单",
                "付费精品",
                "畅销小说",
                "直播专区",
                "蜻蜓商城"]
    }()
    
    private var bottomItemClickHandle: CYFeaturedBottomItemClickHandle?
    
    private var bannerItemClickHandle: CYFeaturedBannerItemClickHandle?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 添加子视图
        setupSubs()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBottomItemClickHandle(handle: @escaping CYFeaturedBottomItemClickHandle) {
        bottomItemClickHandle = handle
    }
    
    func setupBannerItemClickHandle(handle: @escaping CYFeaturedBannerItemClickHandle) {
        bannerItemClickHandle = handle
    }
    
    // 添加子视图
    private func setupSubs() {
        
        // 轮播
        carouselV.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.66)
        }
        
        // 底部选项容器视图
        bottomV.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(carouselV.snp.bottom)
        }
        
        // 底部选项视图
        for index in 0...titles.count - 1 {
            let title = titles[index]
            let image = images[index]
            let itemV = CYFeaturedItemView()
            bottomV.addSubview(itemV)
            itemV.tag = index + 1
            if index == 0 {
                itemV.snp.makeConstraints({ (make) in
                    make.left.top.bottom.equalToSuperview()
                    make.width.equalToSuperview().multipliedBy(1.0 / CGFloat(titles.count))
                })
            } else if index == titles.count - 1 {
                let preItemV = bottomV.viewWithTag(index) as! CYFeaturedItemView
                itemV.snp.makeConstraints({ (make) in
                    make.left.equalTo(preItemV.snp.right)
                    make.top.bottom.right.equalToSuperview()
                })
            } else {
                let preItemV = bottomV.viewWithTag(index) as! CYFeaturedItemView
                itemV.snp.makeConstraints({ (make) in
                    make.left.equalTo(preItemV.snp.right)
                    make.top.bottom.equalToSuperview()
                    make.width.equalTo(preItemV)
                })
            }
            itemV.image = image
            itemV.title = title
            itemV.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(itemVTapGestHandle(tap:))))
        }
    }
    
    // 底部item点击事件
    @objc private func itemVTapGestHandle(tap: UITapGestureRecognizer) {
        if let bottomItemClickHandle = bottomItemClickHandle {
            let itemV = tap.view
            if let itemV = itemV {
                bottomItemClickHandle(CYFeaturedHeaderBottomItemType(rawValue: itemV.tag - 1)!)
            }
        }
    }
    
    private lazy var carouselV: CYCarouselView = {
        let carousel = CYCarouselView.fromNib()
        self.addSubview(carousel)
        return carousel as! CYCarouselView
    }()
    
    private lazy var bottomV: UIView = {
        let bv = UIView()
        self.addSubview(bv)
        bv.backgroundColor = UIColor.white
        return bv
    }()
    
}
