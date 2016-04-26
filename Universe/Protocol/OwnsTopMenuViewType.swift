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

extension OwnsTopMenuViewType {
    func setupTopMenuView() {
        topMenuView.update()
    }
}



//MARK: ShowPopoverAble

protocol ShowPopoverAble: class {
    var popover: Popover! { get set }
}

extension ShowPopoverAble {
    func showMenuPopoverAtPoint(point: CGPoint, view: UIView) {
        let options = [
            .Type(.Down),
            .AnimationIn(0.3),
            .BlackOverlayColor(UIColor.clearColor()),
            .ArrowSize(CGSizeZero),
            .Color(UIColor.clearColor())
            ] as [PopoverOption]
        
        popover = Popover.init(options: options, showHandler: nil, dismissHandler: nil)
        popover.show(view, point: point)
    }
}

//MARK: OwnMenuListType

protocol ShowMenuListAble: ShowPopoverAble {
    var menuListView: MenuListView! { get set }
    var menuListItems: [MenuListItemType] { get set }
}

extension ShowMenuListAble where Self: TopMenuView {
    func setupMenuListView() {
        menuListView = MenuListView(frame: CGRectMake(0, 0, 30, CGFloat(CGFloat(menuListItems.count) * menuItemCellHeight)))
        menuListView.menuItemsList = menuListItems
    }
}

//MARK: MenuListItemType

protocol MenuListItemType{
    var image: UIImage { get set }
    var clickAction: (()->())? { get set }
}
