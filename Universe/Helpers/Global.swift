//
//  Global.swift
//  Universe
//
//  Created by 王振宇 on 16/4/3.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit
import Cache

let ScreenWidth = UIScreen.mainScreen().bounds.width
let ScreenHeight = UIScreen.mainScreen().bounds.height

let Half_Hour: NSTimeInterval = 5

let perHalfHourGold: Int = 10  // 每个番茄始终赚取多少金币

let menuItemCellHeight: CGFloat = 50


//TimmingViewController
enum Scheme: String {
    case YouDaoDict = "yddict://"
    case ShanBayDict = "shanbay://"
    
    var url: NSURL {
        return NSURL(string: self.rawValue)!
    }
    
    var appName: String {
        switch self {
        case .YouDaoDict:
            return "有道词典"
        case .ShanBayDict:
            return "扇贝打卡"
        }
    }
}

//Cache

let cacheConfig = Config(frontKind: .Memory, backKind: .Disk, expiry: .Never, maxSize: 0)
let cache = HybridCache(name: "Universe", config: cacheConfig)

let time_selected_arr: [(CGFloat, CGFloat)] = [(123.5, 58.0), (70.5, 109.5), (64.0, 177.0), (101.5, 224.0), (165.0, 244.5), (233.5, 222.5), (265.5, 145.0)]

let hour_half_arr: [(CGFloat, CGFloat)] = [(159.0, 28.0), (147.0, 75.0), (139.0, 134.5), (168.5, 190.5), (213.0, 227.5), (160.0, 253.0)]
let hour_one_arr: [(CGFloat, CGFloat)] = [(147.0, 29.5), (133.0, 75.5), (123.0, 134.5), (153.0, 190.0), (198.5, 228.0), (146.5, 253.0),(108.5, 220.5)]
let hour_oneAndHalf_arr: [(CGFloat, CGFloat)] = [(143.0, 29.5), (63.0, 71.5), (199.5, 117.0), (85.5, 174.5), (176.5, 184.5), (213.0, 247.5)]
let hour_two_arr: [(CGFloat, CGFloat)] = [(140.0, 30.5), (143.0, 88.0), (204.0, 113.5), (68.0, 146.0), (185.0, 168.0), (148.0, 210.0), (218.0, 242.5)]
let hour_twoAndHalf_arr: [(CGFloat, CGFloat)] = [(116.0, 70.6),(141.0, 29.5), (193.0, 29.0), (222.0, 73.5), (158.0, 114.0), (121.5, 138.0), (105.5, 165.5), (122.5, 223.0), (190.0, 222.0), (228.5, 177.0)]
let hour_three_arr: [(CGFloat, CGFloat)] = [(141.0, 28.5), (117.5, 60.5), (77.0, 71.0), (89.0, 121.5), (67.0, 168.5), (112.5, 223.0), (162.5, 212.0), (219.0, 163.5), (170.5, 109.0), (216.0, 71.5), (245.5, 102.5)]

let time_selected_point_arr: [ViewPoint] = [ViewPoint(sizeType: .Big, point: (123.5, 58.0)),
                                            ViewPoint(sizeType: .Big, point: (70.5, 109.5)),
                                            ViewPoint(sizeType: .Big, point: (64.0, 177.0)),
                                            ViewPoint(sizeType: .Big, point: (101.5, 224.0)),
                                            ViewPoint(sizeType: .Big, point: (165.0, 244.5)),
                                            ViewPoint(sizeType: .Big, point: (233.5, 222.5)),
                                            ViewPoint(sizeType: .Big, point: (265.5, 145.0))]



let hour_half_point_arr: [ViewPoint] = [ViewPoint(sizeType: .Big, point: (161.0, 28.0)),
                                        ViewPoint(sizeType: .Big, point: (147.0, 75.0)),
                                        ViewPoint(sizeType: .Big, point: (139.0, 134.5)),
                                        ViewPoint(sizeType: .Big, point: (168.5, 190.5)),
                                        ViewPoint(sizeType: .Big, point: (213.0, 227.5)),
                                        ViewPoint(sizeType: .Big, point: (160.0, 253.0))]


let hour_one_point_arr: [ViewPoint] = [ViewPoint(sizeType: .Big, point: (147.0, 29.5)),
                                       ViewPoint(sizeType: .Small, point: (140.0, 54.5)),
                                       ViewPoint(sizeType: .Big, point: (133.0, 75.5)),
                                       ViewPoint(sizeType: .Small, point: (129.0, 106.0)),
                                       ViewPoint(sizeType: .Big, point: (123.0, 134.5)),
                                       ViewPoint(sizeType: .Small, point: (137.5, 164.5)),
                                       ViewPoint(sizeType: .Big, point: (153.0, 190.0)),
                                       ViewPoint(sizeType: .Small, point: (176.0, 210.0)),
                                       ViewPoint(sizeType: .Big, point: (198.5, 228.0)),
                                       ViewPoint(sizeType: .Small, point: (174.0, 241.0)),
                                       ViewPoint(sizeType: .Big, point: (146.5, 253.0)),
                                       ViewPoint(sizeType: .Big, point: (108.5, 220.5))]


let hour_oneAndHalf_point_arr: [ViewPoint] = [ViewPoint(sizeType: .Big, point: (143.0, 29.5)),
                                              ViewPoint(sizeType: .Small, point: (115.5, 45.0)),
                                              ViewPoint(sizeType: .Small, point: (93.5, 57.0)),
                                              ViewPoint(sizeType: .Big, point: (63.0, 71.5)),
                                              ViewPoint(sizeType: .Small, point: (103.5, 84.0)),
                                              ViewPoint(sizeType: .Small, point: (135.0, 93.0)),
                                              ViewPoint(sizeType: .Small, point: (165.0, 104.5)),
                                              ViewPoint(sizeType: .Big, point: (199.5, 117.0)),
                                              ViewPoint(sizeType: .Small, point: (162.0, 134.0)),
                                              ViewPoint(sizeType: .Small, point: (135.0, 147.5)),
                                              ViewPoint(sizeType: .Small, point: (112.0, 159.5)),
                                              ViewPoint(sizeType: .Big, point: (85.5, 174.5)),
                                              ViewPoint(sizeType: .Small, point: (117.5, 177.0)),
                                              ViewPoint(sizeType: .Small, point: (145.5, 180.5)),
                                              ViewPoint(sizeType: .Big, point: (176.5, 184.5)),
                                              ViewPoint(sizeType: .Small, point: (188.5, 204.5)),
                                              ViewPoint(sizeType: .Small, point: (202.5, 225.0)),
                                              ViewPoint(sizeType: .Big, point: (213.0, 247.5))]


let hour_two_point_arr: [ViewPoint] = [ViewPoint(sizeType: .Big, point: (140.0, 30.5)),
                                       ViewPoint(sizeType: .Small, point: (142.5, 48.0)),
                                       ViewPoint(sizeType: .Small, point: (142.5, 66.5)),
                                       ViewPoint(sizeType: .Big, point: (143.0, 88.0)),
                                       ViewPoint(sizeType: .Small, point: (162.0, 94.0)),
                                       ViewPoint(sizeType: .Small, point: (181.5, 100.0)),
                                       ViewPoint(sizeType: .Big, point: (202.0, 109.5)),
                                       ViewPoint(sizeType: .Small, point: (177.0, 114.5)),
                                       ViewPoint(sizeType: .Small, point: (156.5, 121.5)),
                                       ViewPoint(sizeType: .Small, point: (135.5, 126.5)),
                                       ViewPoint(sizeType: .Small, point: (114.5, 133.5)),
                                       ViewPoint(sizeType: .Small, point: (94.0, 139.0)),
                                       ViewPoint(sizeType: .Big, point: (70.0, 146.0)),
                                       ViewPoint(sizeType: .Small, point: (95.5, 150.5)),
                                       ViewPoint(sizeType: .Small, point: (114.0, 152.0)),
                                       ViewPoint(sizeType: .Small, point: (136.5, 157.0)),
                                       ViewPoint(sizeType: .Small, point: (155.0, 161.5)),
                                       ViewPoint(sizeType: .Big, point: (182.0, 168.0)),
                                       ViewPoint(sizeType: .Small, point: (170.5, 180.5)),
                                       ViewPoint(sizeType: .Small, point: (162.5, 193.0)),
                                       ViewPoint(sizeType: .Big, point: (151.0, 208.0)),
                                       ViewPoint(sizeType: .Small, point: (172.5, 217.0)),
                                       ViewPoint(sizeType: .Small, point: (192.5, 225.5)),
                                       ViewPoint(sizeType: .Big, point: (213.0, 237.5))]


let hour_twoAndHalf_point_arr: [ViewPoint] = [ViewPoint(sizeType: .Small, point: (125.5, 53.5)),
                                              ViewPoint(sizeType: .Small, point: (131.5, 40.5)),
                                              ViewPoint(sizeType: .Big, point: (141.0, 29.5)),
                                              ViewPoint(sizeType: .Small, point: (165.5, 28.0)),
                                              ViewPoint(sizeType: .Big, point: (193.0, 29.0)),
                                              ViewPoint(sizeType: .Small, point: (202.0, 43.0)),
                                              ViewPoint(sizeType: .Small, point: (211.0, 56.0)),
                                              ViewPoint(sizeType: .Big, point: (222.0, 73.5)),
                                              ViewPoint(sizeType: .Small, point: (204.0, 86.5)),
                                              ViewPoint(sizeType: .Small, point: (191.0, 93.0)),
                                              ViewPoint(sizeType: .Small, point: (176.0, 103.0)),
                                              ViewPoint(sizeType: .Big, point: (158.0, 114.0)),
                                              ViewPoint(sizeType: .Small, point: (145.0, 123.5)),
                                              ViewPoint(sizeType: .Small, point: (134.5, 131.5)),
                                              ViewPoint(sizeType: .Big, point: (121.5, 138.0)),
                                              ViewPoint(sizeType: .Small, point: (114.0, 152.0)),
                                              ViewPoint(sizeType: .Big, point: (105.5, 165.5)),
                                              ViewPoint(sizeType: .Small, point: (110.0, 182.5)),
                                              ViewPoint(sizeType: .Small, point: (114.0, 195.5)),
                                              ViewPoint(sizeType: .Small, point: (118.0, 208.5)),
                                              ViewPoint(sizeType: .Big, point: (122.5, 223.0)),
                                              ViewPoint(sizeType: .Small, point: (137.0, 222.5)),
                                              ViewPoint(sizeType: .Small, point: (149.5, 222.5)),
                                              ViewPoint(sizeType: .Small, point: (162.0, 222.0)),
                                              ViewPoint(sizeType: .Small, point: (173.0, 221.0)),
                                              ViewPoint(sizeType: .Big, point: (190.0, 222.0)),
                                              ViewPoint(sizeType: .Small, point: (200.0, 210.5)),
                                              ViewPoint(sizeType: .Small, point: (206.5, 200.0)),
                                              ViewPoint(sizeType: .Small, point: (215.5, 190.5)),
                                              ViewPoint(sizeType: .Big, point: (228.5, 177.0))]


let hour_three_point_arr: [ViewPoint] = [ViewPoint(sizeType: .Big, point: (141.0, 28.5)),
                                         ViewPoint(sizeType: .Small, point: (128.0, 44.0)),
                                         ViewPoint(sizeType: .Big, point: (117.5, 60.5)),
                                         ViewPoint(sizeType: .Small, point: (97.0, 66.5)),
                                         ViewPoint(sizeType: .Big, point: (77.0, 71.0)),
                                         ViewPoint(sizeType: .Small, point: (81.0, 88.5)),
                                         ViewPoint(sizeType: .Small, point: (85.5, 101.5)),
                                         ViewPoint(sizeType: .Big, point: (89.0, 121.5)),
                                         ViewPoint(sizeType: .Small, point: (80.5, 137.5)),
                                         ViewPoint(sizeType: .Small, point: (75.0, 151.5)),
                                         ViewPoint(sizeType: .Big, point: (67.0, 168.5)),
                                         ViewPoint(sizeType: .Small, point: (76.0, 180.0)),
                                         ViewPoint(sizeType: .Small, point: (84.0, 189.0)),
                                         ViewPoint(sizeType: .Small, point: (92.0, 198.5)),
                                         ViewPoint(sizeType: .Small, point: (101.5, 208.5)),
                                         ViewPoint(sizeType: .Big, point: (112.5, 223.0)),
                                         ViewPoint(sizeType: .Small, point: (130.5, 218.0)),
                                         ViewPoint(sizeType: .Small, point: (143.5, 216.0)),
                                         ViewPoint(sizeType: .Big, point: (162.5, 212.0)),
                                         ViewPoint(sizeType: .Small, point: (175.0, 202.5)),
                                         ViewPoint(sizeType: .Small, point: (185.0, 193.5)),
                                         ViewPoint(sizeType: .Small, point: (195.0, 184.0)),
                                         ViewPoint(sizeType: .Small, point: (204.5, 176.0)),
                                         ViewPoint(sizeType: .Big, point: (219.0, 163.5)),
                                         ViewPoint(sizeType: .Small, point: (209.5, 150.0)),
                                         ViewPoint(sizeType: .Small, point: (198.5, 140.5)),
                                         ViewPoint(sizeType: .Small, point: (191.5, 130.0)),
                                         ViewPoint(sizeType: .Small, point: (183.0, 120.5)),
                                         ViewPoint(sizeType: .Big, point: (170.5, 109.0)),
                                         ViewPoint(sizeType: .Small, point: (183.5, 96.5)),
                                         ViewPoint(sizeType: .Small, point: (194.0, 86.5)),
                                         ViewPoint(sizeType: .Small, point: (202.5, 79.5)),
                                         ViewPoint(sizeType: .Big, point: (216.0, 71.5)),
                                         ViewPoint(sizeType: .Small, point: (225.5, 81.5)),
                                         ViewPoint(sizeType: .Small, point: (234.0, 89.5)),
                                         ViewPoint(sizeType: .Big, point: (245.5, 102.5))]
