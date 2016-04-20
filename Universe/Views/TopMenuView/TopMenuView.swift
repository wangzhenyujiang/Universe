//
//  TopMenuView.swift
//  Universe
//
//  Created by 王振宇 on 16/4/9.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class TopMenuView: UIView {
    private var view: UIView!
    
    var menuAction:(() -> ())?
    
    @IBOutlet private weak var goldLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        view =  NSBundle.mainBundle().loadNibNamed(String(TopMenuView), owner: self, options: nil).first as? UIView
        view.frame = CGRectMake(0, 0, ScreenWidth, 60)
        view.backgroundColor = UIColor.clearColor()
        backgroundColor = UIColor.clearColor()
        addSubview(view)
    }
}

//MARK: Public

extension TopMenuView {
    func update() {
        goldLabel.text = "\(User.shareInstance.gold)"
    }
}

//MARK: Private

extension TopMenuView {
    @IBAction private func menuAction(sender: AnyObject) {
        guard let action = menuAction else { return }
        action()
    }
    
}