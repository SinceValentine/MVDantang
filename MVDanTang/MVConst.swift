//
//  MVConst.swift
//  MVDanTang
//
//  Created by 天景隆 on 2017/6/26.
//  Copyright © 2017年 天景隆. All rights reserved.
//

import UIKit

// 服务器地址
let BASE_URL = "http://api.dantangapp.com/"
// 是否第一次启动
let MVFirstLaunch = "firstLaunch"
// 是否登录
let isLogin = "isLogin"

// 操作成功
let RETURN_OK = 200

let kTitlesViewH: CGFloat = 35
let kTitlesViewY: CGFloat = 64
let kAnimationDuraton = 0.25

let SCREENW = UIScreen.main.bounds.width
let SCREENH = UIScreen.main.bounds.height

let kIndicatorViewH: CGFloat = 2.0
/// 动画时长
let kAnimationDuration = 0.25


func MVColor(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

// 背景灰色
func MVGlobalColor() -> UIColor {
    return MVColor(r: 245, g: 80, b: 83, a: 1.0)
}

// 红色
func MVGlobalRedColor() -> UIColor {
    return MVColor(r: 245, g: 80, b: 83, a: 1.0)
}




