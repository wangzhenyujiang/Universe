//
//  ImageLayerView.swift
//  Universe
//
//  Created by 王振宇 on 16/5/2.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class ImageLayerView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
}

//MARK: Private

extension ImageLayerView {
    private func commonInit() {
        layer.contents = UIImage(named: "statistics_back_image")?.CGImage
    }
}
