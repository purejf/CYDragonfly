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
        
        // titleL
        self.titleL.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
            make.top.equalToSuperview().offset(5)
        }
        
        // img
        self.img.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(self.titleL.snp.bottom)
        }
    }
    
    var title: String?  {
        didSet {
            if let vTitle = title {
                self.titleL.text = vTitle
            }
        }
    }
    
    var image: String? {
        didSet {
            if let vImg = image {
                self.img.image = UIImage(named: vImg)
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
        img.contentMode = .center
        return img
    }()
}

enum CYFeaturedHeaderBottomItemType: Int {
    case Rank = 0
    case Featured
    case Novel
    case Live
    case Mall
}

class CYFeaturedHeaderView: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
 
    typealias CYFeaturedBottomItemClickHandle = (_ index: Int) -> Void
    
    typealias CYFeaturedBannerItemClickHandle = (_ type: CYFeaturedHeaderBottomItemType) -> Void
    
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
        
        // col
        self.col.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, -frame.size.height * 0.3, 0))
        }
        
        // bottomV
        self.bottomV.snp.makeConstraints { (make) in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(self.col.snp.bottom)
        }
        
        // subs
        for index in 0...titles.count - 1 {
            let title = titles[index]
            let image = images[index]
            let itemV = CYFeaturedItemView()
            addSubview(itemV)
            itemV.tag = index + 1
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
                bottomItemClickHandle(itemV.tag - 1)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if (self.titles.count > 0) {
            let itemW = CGFloat(self.frame.size.width) / CGFloat(self.titles.count)
            for index in 0...self.titles.count - 1 {
                let itemV = self.viewWithTag(index + 1) as! CYFeaturedItemView
                itemV.frame = CGRect(x: itemW * CGFloat(index), y: 0, width: itemW, height: self.frame.size.height)
            }
        }
    }
    
    private lazy var col: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let col = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        col.delegate = self
        col.dataSource = self
        self.addSubview(col)
        return col
    }()
    
    private lazy var bottomV: UIView = {
        let bv = UIView()
        self.addSubview(bv)
        return bv
    }()
    
    // MARK: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell.init()
    }
    
}
