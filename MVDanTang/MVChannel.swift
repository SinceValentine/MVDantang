//
//  MVChannel.swift
//  MVDanTang
//
//  Created by 天景隆 on 2017/7/18.
//  Copyright © 2017年 天景隆. All rights reserved.
//

import UIKit

class MVChannel: NSObject {
    var editable: Bool?
    var id: Int?
    var name: String?
    
    
    init(dict: [String: AnyObject]) {
        super.init()
        id = dict["id"] as? Int
        name = dict["name"] as? String
        editable = dict["editable"] as? Bool
    }

    
    
}


