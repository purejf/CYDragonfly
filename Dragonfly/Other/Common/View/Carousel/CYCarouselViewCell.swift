//
//  CYCarouselViewCell.swift
//  Dragonfly
//
//  Created by Charles on 2017/3/17.
//  Copyright © 2017年 cy. All rights reserved.
//

import UIKit

class CYCarouselViewCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    
    var image: String? {
        didSet {
            img.cy_setImage(name: image)
        }
    }
    
}
