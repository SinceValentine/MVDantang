//
//  MVTopicViewController.swift
//  MVDanTang
//
//  Created by 天景隆 on 2017/7/18.
//  Copyright © 2017年 天景隆. All rights reserved.
//

import UIKit

class MVTopicViewController: UITableViewController {
    var type = Int()
    // 首页列表数据
    var items = [MVHomeItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = MVGlobalColor()
        
    }
    
    func setupTableView() {
        tableView.rowHeight = 160
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsetsMake(kTitlesViewY + kTitlesViewH, 0, tabBarController!.tabBar.height, 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
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
