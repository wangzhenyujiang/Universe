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
    var popover: Popover { get set }
}

extension ShowPopoverAble {
    func showMenuPopoverAtPoint(point: CGPoint, view: UIView) {
        let options = [
            .Type(.Down),
            .AnimationIn(0.3),
            .BlackOverlayColor(UIColor.redColor()),
            .ArrowSize(CGSizeZero),
            .Color(UIColor.whiteColor())
            ] as [PopoverOption]
        
        popover = Popover.init(options: options, showHandler: nil, dismissHandler: nil)
        popover.show(view, point: point)
    }
}

//MARK: OwnMenuListType

protocol ShowMenuListAble: ShowPopoverAble {
    var menuListView: MenuListView { get set }
    var menuListItems: [MenuListItemType] { get set }
    func showMenuList()
}

extension ShowMenuListAble where Self: TopMenuView {
    func showMenuList() {
        menuListView = MenuListView(frame: CGRectMake(0, 0, 30, CGFloat(menuListItems.count * 30)))
        menuListView.menuItemsList = menuListItems
        self.menuAction = { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.showMenuPopoverAtPoint(CGPointMake(30, 70), view: strongSelf.menuListView)
        }
    }
}

//MARK: MenuListItemType

protocol MenuListItemType{
    var image: UIImage { get set }
    var clickAction: (()->())? { get set }
}
