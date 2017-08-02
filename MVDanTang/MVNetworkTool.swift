
//
//  MVNetworkTool.swift
//  MVDanTang
//
//  Created by 天景隆 on 2017/8/2.
//  Copyright © 2017年 天景隆. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class MVNetworkTool: NSObject {
    static let shareNetworkTool = MVNetworkTool()
   
    func loadHomeTopData(finished: @escaping (_ mv_channels: [MVChannel]) -> ()) {
        // 获取首页顶部选择数据
        let url = BASE_URL + "v2/channels/preset"
        let params = ["gender": 1,
                      "generation": 1]
        Alamofire
            .request(url, parameters: params)
            .responseJSON { (responds) in
                guard responds.result.isSuccess else {
                    SVProgressHUD.showError(withStatus: "加载失败...")
                    return
                }
                
                if let value = responds.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfo(withStatus: message)
                        return
                    }
                    
                    SVProgressHUD.dismiss()
                    let data = dict["data"].dictionary
                    if let channels = data!["channels"]?.arrayObject {
                        var mv_channels = [MVChannel]()
                        for channel in channels {
                            let mv_channel = MVChannel(dict: channel as! [String: AnyObject])
                            mv_channels.append(mv_channel)
                        }
                        finished(mv_channels)
                    }
                    
                    
                }
                
        }
    }
    
    
    
}
