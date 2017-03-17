//
//  CYRootViewController.swift
//  Dragonfly
//
//  Created by Charles on 2017/3/16.
//  Copyright © 2017年 cy. All rights reserved.
//

import UIKit
import SnapKit

class CYRootViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 配置
        setup()
        
        // 添加子控制器
        setupChilds()
        
        // 配置分页
        setupPages()
    }
    
    private func setup() {
        view.backgroundColor = UIColor.white
        titleV.frame = CGRect(x: 0, y: 0, width: view.frame.size.width - 80, height: 36)
        let leftItem = UIBarButtonItem(customView: titleV)
        navigationItem.leftBarButtonItem = leftItem
    }
    
    private func setupChilds() {
        pageController.willMove(toParentViewController: self)
        addChildViewController(pageController)
        pageController.didMove(toParentViewController: self)
        view.addSubview(pageController.view)
        pageController.view.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
    }
    
    private func setupPages() {
        pageController.setViewControllers([vcs.first!], direction: .forward, animated: true, completion: nil)
    }
    
    private func vcIndex(controller: UIViewController) -> Int? {
        return vcs.index(of: controller)
    }
    
    private func changeVc(index: Int) {
        let vc = vcs[index]
        pageController.setViewControllers([vc], direction: .forward, animated: false, completion: nil)
    }
    
    // MARK: UIPageViewControllerDelegate, UIPageViewControllerDataSource
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = vcIndex(controller: viewController)
        if index == NSNotFound || index == nil {
            return nil
        } else {
            index = index! + 1
            if (index == vcs.count) {
                return nil
            }
            return vcs[index!]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = vcs.index(of: viewController)
        if index == 0 || index == NSNotFound || index == nil {
            return nil
        }
        index = index! - 1
        return vcs[index!]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let vc = pageViewController.viewControllers?.first
        let index = vcIndex(controller: vc!)
        titleV.index = index!
    }
    
    private lazy var pageController: UIPageViewController = {
        let page = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        page.delegate = self
        page.dataSource = self
        return page
    }()
    
    private lazy var titleV: CYRootTitleView = {
        let titleV = CYRootTitleView.titleV()
        titleV.setupItemClickHandle(handle: { (index) in
            self.changeVc(index: index)
        })
        return titleV
    }()
    
    private lazy var vcs: [UIViewController] = {
        var vcs = [UIViewController]()
        let names: [String] = ["CYClassifyViewController",
                               "CYFeaturedViewController",
                               "CYLiveViewController",
                               "CYMineViewController",
                               "CYRadioViewController"]
        for name: String in names {
            let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
            let cls = NSClassFromString(nameSpace + "." + name) as! UIViewController.Type
            vcs.append(cls.init())
        }
        return vcs
    }()
}

