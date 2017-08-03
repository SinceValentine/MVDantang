//
//  MVDanTangViewController.swift
//  MVDanTang
//
//  Created by 天景隆 on 2017/6/30.
//  Copyright © 2017年 天景隆. All rights reserved.
//

import UIKit

class MVDanTangViewController: UIViewController {
    var channels = [MVChannel]()
    // 标签
    weak var titlesView = UIView()
    // 底部红色指示器
    weak var indicatorView = UIView()

    weak var contentView = UIScrollView()
    // 当前选中的按钮
    weak var selectedButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置导航栏
        setupNav()
        weak var weakSelf = self
        // 获取首页顶部选择数据
        MVNetworkTool.shareNetworkTool.loadHomeTopData { (mv_channels) in
            for channel in mv_channels {
                let vc = MVTopicViewController()
                vc.title = channel.name
                vc.type = channel.id!
                weakSelf?.addChildViewController(vc)
            }
            
            weakSelf!.setupTitlesView()
            weakSelf!.setupContentView()
        }
    }
    
    
    // 初始化子控制器
    func setupChildViewControllers() {
        for channel in channels {
            let vc = MVTopicViewController()
            vc.title = channel.name
            addChildViewController(vc)
            
        }
    }
    
    // 顶部标签栏
    func setupTitlesView() {
        // 顶部背景
        let bgView = UIView()
        bgView.frame = CGRect(x: 0, y: kTitlesViewY, width: SCREENW, height: kTitlesViewH)
        view.addSubview(bgView)
        // 标签
        let titlesView = UIView()
        titlesView.backgroundColor = MVGlobalColor()
        titlesView.frame = CGRect(x: 0, y: 0, width: SCREENW - kTitlesViewH, height: kTitlesViewH)
        bgView.addSubview(titlesView)
        self.titlesView = titlesView
        // 底部红色指示器
        let indicatorView = UIView()
        indicatorView.backgroundColor = MVGlobalRedColor()
        indicatorView.height = kIndicatorViewH
        indicatorView.y = kTitlesViewH - kIndicatorViewH
        indicatorView.tag = -1
        self.indicatorView = indicatorView
        // 选择按钮
        let arrowButton = UIButton()
        arrowButton.frame = CGRect(x: SCREENW - kTitlesViewH, y: 0, width: kTitlesViewH, height: kTitlesViewH)
        arrowButton.setImage(UIImage(named: "arrow_index_down_8x4_"), for: .normal)
        arrowButton.addTarget(self, action: #selector(arrowButtonClick(button:)), for: .touchUpInside)
        arrowButton.backgroundColor = MVGlobalColor()
        bgView.addSubview(arrowButton)
        
        let count = childViewControllers.count
        let width = titlesView.bounds.width / CGFloat(count)
        let height = titlesView.bounds.height
        
        for index in 0..<count {
            let button = UIButton()
            button.height = height
            button.width = width
            button.x =  CGFloat(index) * width
            button.tag = index
            let vc = childViewControllers[index]
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            button.setTitle(vc.title, for: .normal)
            button.setTitleColor(UIColor.gray, for: .normal)
            button.setTitleColor(MVGlobalRedColor(), for: .disabled)
            button.addTarget(self, action: #selector(titlesClick(button:)), for: .touchUpInside)
            titlesView.addSubview(button)
            // 默认点击第一个按钮
            if index == 0 {
                button.isEnabled = false
                selectedButton = button
                button.titleLabel?.sizeToFit()
                indicatorView.width = button.titleLabel!.width
                indicatorView.centerX = button.centerX
            }
            
        }
        titlesView.addSubview(indicatorView)

    }
    
    
    func arrowButtonClick(button: UIButton) {
        UIView.animate(withDuration: 0.25) { 
            button.imageView?.transform = button.imageView!.transform.rotated(by: CGFloat(Double.pi))
        }
    }
    
    func titlesClick(button: UIButton) {
        selectedButton?.isEnabled = true
        button.isEnabled = false
        selectedButton = button
        
        UIView.animate(withDuration: kAnimationDuraton) { 
            self.indicatorView!.width = self.selectedButton!.titleLabel!.width
            self.indicatorView!.centerX = self.selectedButton!.centerX
        }
        
        var offset = contentView!.contentOffset
        offset.x = CGFloat(button.tag) * contentView!.width
        contentView!.setContentOffset(offset, animated: true)
    }
    
    
    
    // 底部的scrollView
    func setupContentView() {
        // 不要自动调整inset
        automaticallyAdjustsScrollViewInsets = false
        
        let contentView = UIScrollView()
        contentView.frame = view.frame
        contentView.delegate = self
        contentView.contentSize = CGSize(width: contentView.frame.width * CGFloat(childViewControllers.count), height: 0)
        contentView.isPagingEnabled = true
        view.insertSubview(contentView, at: 0)
        self.contentView = contentView
        // 添加第一个控制器的view
    }
    
    // 设置导航栏
    func setupNav() {
        view.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Feed_SearchBtn_18x18_"), style: .plain, target: self, action: #selector(dantangRightBBClick))
    }
    
    func dantangRightBBClick() {
        let searchBarVC = MVSearchViewController()
        navigationController?.pushViewController(searchBarVC, animated: true)
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MVDanTangViewController: UIScrollViewDelegate {
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
        // 当前索引
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        
        let button = titlesView?.subviews[index] as! UIButton
        titlesClick(button: button)
    }
}

