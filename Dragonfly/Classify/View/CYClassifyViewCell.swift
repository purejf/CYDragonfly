//
//  CYClassifyViewCell.swift
//  Dragonfly
//
//  Created by Charles on 2017/3/17.
//  Copyright © 2017年 cy. All rights reserved.
//

import UIKit

class CYClassifyViewCell: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet var labels: [UILabel]!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for label in labels {
            label.layer.borderWidth = 1.0 / UIScreen.main.scale
            label.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
}
