//
//  CYCarouselView.swift
//  Dragonfly
//
//  Created by Charles on 2017/3/17.
//  Copyright © 2017年 cy. All rights reserved.
//  轮播视图

import UIKit

class CYCarouselView: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    typealias CYCarouselViewItemClickHandle = (_ index: Int) ->Void
    
    @IBOutlet weak var col: UICollectionView!
    
    static let sectionCount = 200
    
    var interval: TimeInterval = 5.0
    
    var repeats: Bool = true
    
    private var timer: Timer?
    
    private var itemClickHandle: CYCarouselViewItemClickHandle?
    
    var urls: [String]? {
        didSet {
            guard urls != nil else {
                return
            }
            addTimer()
            col.reloadData()
        }
    }
    
    func setupItemClickHandle(handle: @escaping CYCarouselViewItemClickHandle) {
        itemClickHandle = handle
    }
    
    // MARK: Timer
    
    func addTimer() {
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(nextPage), userInfo: nil, repeats: repeats)
        RunLoop.main.add(timer!, forMode: .commonModes)
    }
    
    func removeTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    // 下一页
    @objc private func nextPage() {
        let reset = resetIP()
        if let reset = reset {
            var nextItem = reset.item + 1
            var nextSec = reset.section
            if nextItem == urls?.count {
                nextItem = 0
                nextSec = nextSec + 1
            }
            let next = IndexPath(item: nextItem, section: nextSec)
            col.scrollToItem(at: next, at: .left, animated: true)
        }
    }
    
    private func resetIP() -> IndexPath? {
        let cur = col.indexPathsForVisibleItems.last
        if let cur = cur {
            let reset = IndexPath(item: cur.item, section: CYCarouselView.sectionCount / 2)
            col.scrollToItem(at: reset, at: .left, animated: false)
            return reset
        }
        return nil
    }
    
    // MARK: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeTimer()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return CYCarouselView.sectionCount
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let urls = urls {
            return urls.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = CYCarouselViewCell.nibCell(WithCollectionView: collectionView, indexPath: indexPath) as! CYCarouselViewCell
        cell.image = urls?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let handle = itemClickHandle {
            handle(indexPath.item)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
}
