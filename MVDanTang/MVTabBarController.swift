//
//  MVTabBarController.swift
//  MVDanTang
//
//  Created by 天景隆 on 2017/6/27.
//  Copyright © 2017年 天景隆. All rights reserved.
//

import UIKit

class MVTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBar = UITabBar.appearance()
        tabBar.tintColor = MVColor(r: 245, g: 90, b: 93, a: 1)
        addChildViewControlles()
    }
    
    private func addChildViewControlles() {
            addChildViewController(childController: MVDanTangViewController(), title: "单糖", imageName: "TabBar_home_23x23_")
            addChildViewController(childController: MVProductViewController(), title: "单品", imageName: "TabBar_gift_23x23_")
            addChildViewController(childController: MVCategoryViewController(), title: "分类", imageName: "TabBar_category_23x23_")
            addChildViewController(childController: MVMeViewController(), title: "我的", imageName: "TabBar_me_boy_23x23_")
    }
    
    // 初始化子控制器
    private func addChildViewController(childController: UIViewController, title: String, imageName: String) {
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: imageName + "selected")
        childController.title = title
        let navC = MVNavigationController(rootViewController: childController)
        addChildViewController(navC)
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
