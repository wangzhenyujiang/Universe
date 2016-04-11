//
//  LockAlterView.swift
//  Universe
//
//  Created by 王振宇 on 16/4/11.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

private let alterWidth: CGFloat = 160
private let alterHeight: CGFloat = 240

class LockAlterView: UIView {

    @IBOutlet private weak var starImageView: UIImageView!
    
    private static let shareInstance: LockAlterView = LockAlterView()
    
    private var view: UIView!
    private var showing: Bool = false
    private var alphaView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight))
        comintInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
    }
}

//MARK: Public

extension LockAlterView {
    static func show(starImageName: String) {
        if shareInstance.showing {
            return
        }
        shareInstance.starImageView.image = UIImage(named: starImageName)!
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

//MARK: Private 

extension LockAlterView {
    private func comintInit() {
        
        let alterFrame = CGRectMake(ScreenWidth / 2 - alterWidth / 2, ScreenHeight / 2 - alterHeight / 2, alterWidth, alterHeight)
        
        alphaView = UIView(frame: bounds)
        alphaView.backgroundColor = UIColor.blackColor()
        alphaView.alpha = 0.6
//        alphaView.layer.cornerRadius = 5.0
        addSubview(alphaView)
        
        view = NSBundle.mainBundle().loadNibNamed(String(LockAlterView), owner: self, options: nil).first as! UIView
        view.frame = alterFrame
        view.backgroundColor = UIColor.clearColor()
        view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        addSubview(view)
        
    }
}

//MARK: Super

extension LockAlterView {
    override func willMoveToSuperview(newSuperview: UIView?) {
        guard let superView = newSuperview else { return }
        center = superView.center
    }
}

//MARK: IBAction

extension LockAlterView {
    
    @IBAction func okClickAction(sender: AnyObject) {
        LockAlterView.hide()
    }
}
