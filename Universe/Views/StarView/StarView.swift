//
//  StarView.swift
//  Universe
//
//  Created by 王振宇 on 16/3/26.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class StarView: UIView {

    private var view: UIView!
    
    var clickAction: (StarType? -> Void)?
    var star: StarType? {
        didSet {
            starImage.image = UIImage(named: star!.imageName)
        }
    }
    
    @IBOutlet weak private var starImage: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        commonInit()
    }
    
    
    private func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        view =  NSBundle.mainBundle().loadNibNamed(String(StarView), owner: self, options: nil).first as? UIView
        view.frame = bounds
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        addSubview(view)
    }
    
    @IBAction private func clickAction(sender: AnyObject) {
        guard let action = clickAction else {
            print("StarView 没有实现点击事件")
            return
        }
        action(star)
    }
}
