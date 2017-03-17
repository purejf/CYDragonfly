//
//  CYClassifyViewCell.swift
//  Dragonfly
//
//  Created by Charles on 2017/3/17.
//  Copyright © 2017年 cy. All rights reserved.
//

import UIKit

class CYClassifyViewCell: UICollectionViewCell {
    
    typealias CYClassifyViewCellItemClickHandle = (_ index: Int) -> Void
    
    typealias CYClassifyViewCellMainItemClickHandle = () -> Void
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet var labels: [UILabel]!
    
    private var itemClickHandle: CYClassifyViewCellItemClickHandle?
    
    private var mainItemClickHandle: CYClassifyViewCellMainItemClickHandle?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for label in labels {
            label.layer.borderWidth = 1.0 / UIScreen.main.scale
            label.layer.borderColor = UIColor.lightGray.cgColor
            label.isUserInteractionEnabled = true
            label.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(labelTapGestHandle(tap:))))
        }
        
        img.isUserInteractionEnabled = true
        img.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(imgTapGestHandle)))
    }
    
    @objc private func labelTapGestHandle(tap: UITapGestureRecognizer) {
        if let label = tap.view, let handle = itemClickHandle {
            let index = labels.index(of: label as! UILabel)
            handle(index!)
        }
    }
    
    @objc private func imgTapGestHandle() {
        if let handle = mainItemClickHandle {
            handle()
        }
    }
    
    func setupItemClickHandle(handle: @escaping CYClassifyViewCellItemClickHandle) {
        itemClickHandle = handle
    }
    
    func setupMainItemClickHandle(handle: @escaping CYClassifyViewCellMainItemClickHandle) {
        mainItemClickHandle = handle
    }
    
    
    
}
