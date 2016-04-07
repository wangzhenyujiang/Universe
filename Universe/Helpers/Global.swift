//
//  Global.swift
//  Universe
//
//  Created by 王振宇 on 16/4/3.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

let ScreenWidth = UIScreen.mainScreen().bounds.width
let ScreenHeight = UIScreen.mainScreen().bounds.height

let time_selected_arr: [(CGFloat, CGFloat)] = [(123.5, 58.0), (70.5, 109.5), (64.0, 177.0), (101.5, 224.0), (165.0, 244.5), (233.5, 222.5), (265.5, 145.0)]

let hour_half_arr: [(CGFloat, CGFloat)] = [(161.0, 28.0), (147.0, 75.0), (139.0, 134.5), (168.5, 190.5), (213.0, 227.5), (160.0, 253.0)]
let hour_one_arr: [(CGFloat, CGFloat)] = [(147.0, 29.5), (133.0, 75.5), (123.0, 134.5), (153.0, 190.0), (198.5, 228.0), (146.5, 253.0),(108.5, 220.5)]
let hour_oneAndHalf_arr: [(CGFloat, CGFloat)] = [(143.0, 29.5), (63.0, 71.5), (199.5, 117.0), (85.5, 174.5), (176.5, 184.5), (213.0, 247.5)]
let hour_two_arr: [(CGFloat, CGFloat)] = [(141.0, 29.0), (143.0, 88.0), (202.0, 109.5), (70.0, 146.0), (182.0, 168.0), (151.0, 208.0), (213.0, 237.5)]
let hour_twoAndHalf_arr: [(CGFloat, CGFloat)] = [(141.0, 29.5), (193.0, 29.0), (222.0, 73.5), (158.0, 114.0), (121.5, 138.0), (105.5, 165.5), (122.5, 223.0), (190.0, 222.0), (228.5, 177.0)]
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
                                       ViewPoint(sizeType: .Big, point: (133.0, 75.5)),
                                       ViewPoint(sizeType: .Big, point: (123.0, 134.5)),
                                       ViewPoint(sizeType: .Big, point: (153.0, 190.0)),
                                       ViewPoint(sizeType: .Big, point: (198.5, 228.0)),
                                       ViewPoint(sizeType: .Big, point: (146.5, 253.0)),
                                       ViewPoint(sizeType: .Big, point: (108.5, 220.5))]
let hour_oneAndHalf_point_arr: [ViewPoint] = [ViewPoint(sizeType: .Big, point: (143.0, 29.5)),
                                              ViewPoint(sizeType: .Big, point: (63.0, 71.5)),
                                              ViewPoint(sizeType: .Big, point: (199.5, 117.0)),
                                              ViewPoint(sizeType: .Big, point: (85.5, 174.5)),
                                              ViewPoint(sizeType: .Big, point: (176.5, 184.5)),
                                              ViewPoint(sizeType: .Big, point: (213.0, 247.5))]
let hour_two_point_arr: [ViewPoint] = [ViewPoint(sizeType: .Big, point: (141.0, 29.0)),
                                       ViewPoint(sizeType: .Big, point: (143.0, 88.0)),
                                       ViewPoint(sizeType: .Big, point: (202.0, 109.5)),
                                       ViewPoint(sizeType: .Big, point: (70.0, 146.0)),
                                       ViewPoint(sizeType: .Big, point: (182.0, 168.0)),
                                       ViewPoint(sizeType: .Big, point: (151.0, 208.0)),
                                       ViewPoint(sizeType: .Big, point: (213.0, 237.5))]
let hour_twoAndHalf_point_arr: [ViewPoint] = [ViewPoint(sizeType: .Big, point: (141.0, 29.5)),
                                              ViewPoint(sizeType: .Big, point: (193.0, 29.0)),
                                              ViewPoint(sizeType: .Big, point: (222.0, 73.5)),
                                              ViewPoint(sizeType: .Big, point: (158.0, 114.0)),
                                              ViewPoint(sizeType: .Big, point: (121.5, 138.0)),
                                              ViewPoint(sizeType: .Big, point: (105.5, 165.5)),
                                              ViewPoint(sizeType: .Big, point: (122.5, 223.0)),
                                              ViewPoint(sizeType: .Big, point: (190.0, 222.0)),
                                              ViewPoint(sizeType: .Big, point: (228.5, 177.0))]
let hour_three_point_arr: [ViewPoint] = [ViewPoint(sizeType: .Big, point: (141.0, 28.5)),
                                         ViewPoint(sizeType: .Big, point: (117.5, 60.5)),
                                         ViewPoint(sizeType: .Big, point: (77.0, 71.0)),
                                         ViewPoint(sizeType: .Big, point: (89.0, 121.5)),
                                         ViewPoint(sizeType: .Big, point: (67.0, 168.5)),
                                         ViewPoint(sizeType: .Big, point: (112.5, 223.0)),
                                         ViewPoint(sizeType: .Big, point: (162.5, 212.0)),
                                         ViewPoint(sizeType: .Big, point: (219.0, 163.5)),
                                         ViewPoint(sizeType: .Big, point: (170.5, 109.0)),
                                         ViewPoint(sizeType: .Big, point: (216.0, 71.5)),
                                         ViewPoint(sizeType: .Big, point: (245.5, 102.5))]


