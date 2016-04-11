//
//  GoldAlterView.swift
//  Universe
//
//  Created by 王振宇 on 16/4/3.
//  Copyright © 2016年 王振宇. All rights reserved.
//

private let alterWidth: CGFloat = 200
private let alterHeight: CGFloat = 180

import UIKit

class GoldAlterView: UIView {
    
    private static let shareInstance: GoldAlterView = GoldAlterView()

    var alphaProcess: CGFloat = 0.8 {
        didSet {
            alphaView.alpha = alphaProcess
        }
    }
    
    private var view: UIView!
    private var alphaView: UIView!
    private var showing: Bool = false
    
    @IBOutlet weak private var glodNumLabel: UILabel!
    
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
        
        let alterFrame = CGRectMake(ScreenWidth / 2 - alterWidth / 2, ScreenHeight / 2 - alterHeight / 2, alterWidth, alterHeight)
        
        alphaView = UIView(frame: alterFrame)
        alphaView.backgroundColor = UIColor.whiteColor()
        alphaView.alpha = alphaProcess
        alphaView.layer.cornerRadius = 5.0
        addSubview(alphaView)
        
        view =  NSBundle.mainBundle().loadNibNamed(String(GoldAlterView), owner: self, options: nil).first as? UIView
        view.frame = alterFrame
        view.backgroundColor = UIColor.clearColor()
        addSubview(view)
        
        backgroundColor = UIColor.clearColor()
    }
}

//MARK : Public

extension GoldAlterView {
    static func show(glod: Int = 0) {
        if shareInstance.showing {
            return
        }
        shareInstance.glodNumLabel.text = "\(glod)"
        
        UIApplication.sharedApplication().windows.first?.addSubview(shareInstance)
        
        shareInstance.showing = true
    }
    
    static func hide() {
        if !shareInstance.showing {
            return
        }
        
        shareInstance.removeFromSuperview()
        shareInstance.showing = false
    }
}

//MARK : IBAction

extension GoldAlterView {
    @IBAction func okClickAction(sender: AnyObject) {
        GoldAlterView.hide()
    }
}

