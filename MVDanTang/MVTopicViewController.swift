//
//  MVTopicViewController.swift
//  MVDanTang
//
//  Created by 天景隆 on 2017/7/18.
//  Copyright © 2017年 天景隆. All rights reserved.
//

import UIKit

class MVTopicViewController: UITableViewController, MVHomeCellDelegate {
    var type = Int()
    // 首页列表数据
    var items = [MVHomeItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = MVGlobalColor()
        
        setupTableView()
        
        refreshControl?.addTarget(self, action: #selector(loadHomeData), for: .valueChanged)
        weak var weakSelf = self
        MVNetworkTool.shareNetworkTool.loadHomeInfo(id: type) { (homoItems) in
            weakSelf!.items = homoItems
            weakSelf!.tableView.reloadData()
        }
        
        
    }
    
    func loadHomeData() {
        weak var weakSelf = self
        MVNetworkTool.shareNetworkTool.loadHomeInfo(id: type) { (homoItems) in
            weakSelf!.items = homoItems
            weakSelf!.tableView.reloadData()
            weakSelf!.refreshControl?.endRefreshing()
        }
    }
    
    func setupTableView() {
        tableView.rowHeight = 160
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsetsMake(kTitlesViewY + kTitlesViewH, 0, tabBarController!.tabBar.height, 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
        let nib = UINib(nibName: String(describing: MVHomeCell.self), bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: String(describing: MVHomeCell.self))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCell(withIdentifier: String(describing: MVHomeCell.self), for: indexPath) as! MVHomeCell
        homeCell.selectionStyle = .none
        homeCell.homeItem = items[indexPath.row]
        homeCell.delegate = self
        return homeCell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = MVDetailViewController()
        detailVC.homeItem = items[indexPath.row]
        detailVC.title = "攻略详情"
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    func homeCellDidClickedFavoriteButton(button: UIButton) {
        if !UserDefaults.standard.bool(forKey: isLogin) {
//            let loginVC = 
        }
        
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
