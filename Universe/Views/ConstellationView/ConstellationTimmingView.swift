//
//  ConstellationTimmingView.swift
//  Universe
//
//  Created by 王振宇 on 16/4/7.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit

class ConstellationTimmingView: UIView {
    
    var timmingType: TimeType = TimeType.Half {
        didSet {
            
        }
    }
    
    private var maskLayer: CAShapeLayer!
    private var constellationBackView: ConstellationView!
    private var maskImage: UIImage!
    
    override init(frame: CGRect) {
        super.init(frame: CGRectMake(0, 0, 300, 300))
        constellationBackView = ConstellationView()
        addSubview(constellationBackView)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
    }
    
    convenience init(timmingType: TimeType) {
        self.init(frame: CGRectZero)
        self.timmingType = timmingType
        
        constellationBackView.pointArray = timmingType.viewPointArr
        
        maskImage = UIImage(named: timmingType.maskImageName)
        maskLayer = CAShapeLayer()
        maskLayer.contents = maskImage.CGImage
        maskLayer.frame = CGRectMake(0, 0, maskImage.size.width, maskImage.size.height)
        layer.mask = maskLayer
    }
    
    override func willMoveToSuperview(newSuperview: UIView?) {
        guard let superview = newSuperview else { return }
        center = superview.center
    }
        
}
