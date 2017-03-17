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
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = header
    }
    
    // MARK: UITableViewDelegate, UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
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
        return header
    }()
}



