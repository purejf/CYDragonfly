//
//  CYFeaturedViewController.swift
//  Dragonfly
//
//  Created by Charles on 2017/3/16.
//  Copyright © 2017年 cy. All rights reserved.
//

import UIKit

class CYFeaturedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 配置
        setup()
    }
    
    // 配置
    private func setup() {
        view.backgroundColor = UIColor.orange
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 0.01))
        tableView.tableHeaderView = header
        tableView.sectionFooterHeight = 0.01
        tableView.sectionHeaderHeight = 0.01
    }
    
    // MARK: UITableViewDelegate, UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CYFeaturedTopicCell.cell(WithTableView: tableView)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // 人气榜单、付费精品、畅销小说、直播专区、蜻蜓商城
    private func _headerBottomItemClick(type: CYFeaturedHeaderBottomItemType) {
        switch type {
        case .Rank: break
        case .Featured: break
        case .Novel: break
        case .Live: break
        case .Mall: break
        }
    }
    
    private lazy var header: CYFeaturedHeaderView = {
        let header = CYFeaturedHeaderView()
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200)
        header.setupBannerItemClickHandle(handle: { (index) in
            
        })
        header.setupBottomItemClickHandle(handle: { (type) in
            self._headerBottomItemClick(type: type)
        })
        header.urls = ["http://img2.imgtn.bdimg.com/it/u=797582015,970274971&fm=214&gp=0.jpg",
                       "http://img.zcool.cn/community/01392d578c4cb60000018c1ba15f76.JPG",
                       "http://pic81.huitu.com/res/20160706/1029007_20160706190300146500_1.jpg"]
        return header
    }()
}



