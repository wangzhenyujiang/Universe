//
//  GoldAlterView.swift
//  Universe
//
//  Created by 王振宇 on 16/4/3.
//  Copyright © 2016年 王振宇. All rights reserved.
//

let alterWidth: CGFloat = 200
let alterHeight: CGFloat = 180

import UIKit

class GoldAlterView: UIView {
    
    private var view: UIView!
    static let shareInstance: GoldAlterView = GoldAlterView()
    
    var showing: Bool = false
    
    @IBOutlet weak var glodNumLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight))
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
    }
    
    private func commonInit() {
        view =  NSBundle.mainBundle().loadNibNamed(String(GoldAlterView), owner: self, options: nil).first as? UIView
        view.frame = CGRectMake(ScreenWidth / 2 - alterWidth / 2, ScreenHeight / 2 - alterHeight / 2, alterWidth, alterHeight)
        view.backgroundColor = UIColor.whiteColor()
        addSubview(view)
        
        backgroundColor = UIColor.clearColor()
    }
}

//MARK : Public

extension GoldAlterView {
    static func show(glod: Int = 0) {
        shareInstance.glodNumLabel.text = "\(glod)"
        
        UIApplication.sharedApplication().windows.first?.addSubview(shareInstance)
        
        shareInstance.showing = true
    }
    
    static func hide() {
        if (shareInstance.showing) {
            shareInstance.removeFromSuperview()
        }
        shareInstance.showing = false
    }
}

//MARK : IBAction

extension GoldAlterView {
    @IBAction func okClickAction(sender: AnyObject) {
        GoldAlterView.hide()
    }
}
