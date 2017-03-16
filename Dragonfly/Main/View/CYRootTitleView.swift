//
//  CYRootTitleView.swift
//  Dragonfly
//
//  Created by Charles on 2017/3/16.
//  Copyright © 2017年 cy. All rights reserved.
//

import UIKit

class CYRootTitleView: UIView {
    
    typealias CYRootTitleItemClickHandle = (_ index: Int) -> Void
    
    var itemClickHandle: CYRootTitleItemClickHandle?
    
    @IBOutlet weak var mineBtn: UIButton!
    
    @IBOutlet weak var featuredBtn: UIButton!
    
    @IBOutlet weak var classifyBtn: UIButton!
    
    @IBOutlet weak var liveBtn: UIButton!
    
    @IBOutlet weak var radioBtn: UIButton!
    
    private var tmpBtn: UIButton?
    
    var index: Int = 0 {
        didSet {
            let btn = self.viewWithTag(index + 1) as? UIButton
            if let btn = btn {
                tmpBtn?.isSelected = false
                btn.isSelected = true
                tmpBtn = btn
            }
        }
    }
    
    public class func titleV() -> CYRootTitleView {
        return Bundle.main.loadNibNamed("CYRootTitleView", owner: nil, options: nil)?.first as! CYRootTitleView
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tmpBtn = self.mineBtn
    }
    
    
    @IBAction private func btnClick(_ sender: UIButton) {
        if sender.isSelected {
            return
        }
        tmpBtn?.isSelected = false
        sender.isSelected = true
        tmpBtn = sender
        if let handle = itemClickHandle {
            handle(sender.tag - 1)
        }
    }
}
