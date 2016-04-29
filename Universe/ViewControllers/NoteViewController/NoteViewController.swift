//
//  NoteViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/4/26.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit
import KeyboardMan

let keyboardMan = KeyboardMan()

class NoteViewController: BaseViewController {
    
    @IBOutlet weak var topMenuView: TopMenuView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textViewContainter: UIView!
    
    @IBOutlet weak var centerYConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTopMenuView()
        setupKeyBoardMan()
        
        textViewContainter.layer.cornerRadius = 10.0
        textViewContainter.clipsToBounds = true
        
    }
}

extension NoteViewController: OwnsTopMenuViewType {
    
}

extension NoteViewController {
    
    @IBAction func backAction(sender: AnyObject) {
        let controllers = navigationController?.viewControllers.filter { controller in return controller is StartViewController}
        navigationController?.popToViewController(controllers!.first!, animated: true)
    }
}

extension NoteViewController {
    private func setupKeyBoardMan() {
        keyboardMan.animateWhenKeyboardAppear = { [weak self] appearPostIndex, keyboardHeight, keyboardHeightIncrement in
            guard let strongSelf = self  else { return }
            print("\(appearPostIndex)")
            strongSelf.centerYConstraint.constant = ScreenHeight - strongSelf.textViewContainter.frame.origin.y - strongSelf.textViewContainter.frame.height - keyboardHeight - 4
            strongSelf.view.layoutIfNeeded()
        }
        
        keyboardMan.animateWhenKeyboardDisappear = { [weak self] keyboardHeight in
            guard let strongSelf = self else { return }
            strongSelf.centerYConstraint.constant = 0
            strongSelf.view.layoutIfNeeded()
        }
    }
}
