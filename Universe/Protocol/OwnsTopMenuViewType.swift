//
//  OwnsTopMenuViewType.swift
//  Universe
//
//  Created by 王振宇 on 16/4/20.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit
import Popover

//MARK: OwnsTopMenuViewType

protocol OwnsTopMenuViewType: class {
    var topMenuView: TopMenuView! { get set }
}

extension OwnsTopMenuViewType  where Self: UIViewController {
    func setupTopMenuView() {
        topMenuView.update()
        topMenuView.menuAction = { [weak self] in
            guard let strongSelf = self else { return }
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let navigation: UniverseNavigationController = sb.instantiateViewControllerWithIdentifier("SettingNavigationController") as! UniverseNavigationController
            strongSelf.presentViewController(navigation, animated: true, completion: nil)
        }
    }
}

//MARK: ShowPopoverAble

protocol ShowPopoverAble: class {
    func showMenuPopoverAtPoint(point: CGPoint)
}

extension ShowPopoverAble  where Self: OwnsTopMenuViewType{
    func showMenuPopoverAtPoint(point: CGPoint) {
        topMenuView.menuAction = { [weak self] in
            guard let _ = self else { return }
            let options = [
                .Type(.Down),
                .AnimationIn(0.3),
                .BlackOverlayColor(UIColor.redColor()),
                .ArrowSize(CGSizeZero),
                .Color(UIColor.whiteColor())
                ] as [PopoverOption]
            
            let popover = Popover.init(options: options, showHandler: nil, dismissHandler: nil)
            popover.show(UIView(frame: popover.bounds), point: CGPointMake(30, 70))
        }
    }
}

//MARK: OwnMenuListType

protocol OwnMenuListType {
    
}

//MARK: MenuListItemType

protocol MenuListItemType{
    var image: UIImage { get set }
    var clickAction: (()->())? { get set }
}
