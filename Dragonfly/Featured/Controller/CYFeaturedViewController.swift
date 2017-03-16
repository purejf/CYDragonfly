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
        self.view.backgroundColor = UIColor.orange
        self.tableView.tableFooterView = UIView()
        self.tableView.tableHeaderView = self.header
    }
    
    
    // MARK: UITableViewDelegate, UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    private lazy var header: CYFeaturedHeaderView = {
        let header = CYFeaturedHeaderView()
        header.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200)
        header.setupBannerItemClickHandle(handle: { (type) in
            
        })
        header.setupBottomItemClickHandle(handle: { (index) in
            
        })
        return header
    }()
}



