//
//  CYFeatureTopicTitleView.swift
//  Dragonfly
//
//  Created by Charles on 17/3/16.
//  Copyright © 2017年 cy. All rights reserved.
//

import UIKit

class CYFeaturedTopicTitleView: UIView {
    
    typealias CYFeatureTopicTitleVMoreItemClickHandle = () -> Void
    
    private var moreItemClickHandle: CYFeatureTopicTitleVMoreItemClickHandle?
    
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
        // 线
        lineV.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(15)
            make.bottom.equalToSuperview().offset(-15)
            make.width.equalTo(5)
        }
        
        // 更多图标
        accImg.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-20)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(accImg.snp.height)
        }
        
        // 更多
        moreL.snp.makeConstraints { (make) in
            make.right.equalTo(accImg.snp.left).offset(-5)
            make.top.bottom.equalToSuperview()
        }
        
        // 标题
        titleL.snp.makeConstraints { (make) in
            make.left.equalTo(lineV.snp.right).offset(10)
            make.top.bottom.equalToSuperview()
            make.right.equalTo(moreL.snp.left)
        }
    }
    
    func setupMoreItemClickHandle(handle: @escaping CYFeatureTopicTitleVMoreItemClickHandle) {
        moreItemClickHandle = handle
    }
    
    // 查看更多
    @objc private func gotoMore() {
        if let handle = moreItemClickHandle {
            handle()
        }
    }
    
    private lazy var accImg: UIImageView = {
        let img = UIImageView()
        self.addSubview(img)
        img.contentMode = .center
        img.isUserInteractionEnabled = true
        img.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(gotoMore)))
        return img
    }()
    
    private lazy var moreL: UILabel = {
        let more = UILabel()
        self.addSubview(more)
        more.textAlignment = .right
        more.textColor = UIColor.black
        more.font = UIFont.systemFont(ofSize: 14)
        more.text = "更多"
        more.isUserInteractionEnabled = true
        more.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(gotoMore)))
        return more
    }()
    
    private lazy var titleL: UILabel = {
        let title = UILabel()
        self.addSubview(title)
        title.textColor = UIColor.black
        title.font = UIFont.systemFont(ofSize: 14)
        title.text = "头条"
        return title
    }()
    
    private lazy var lineV: UIView = {
        let line = UIView()
        self.addSubview(line)
        line.backgroundColor = UIColor.red
        return line
    }()
    
}
