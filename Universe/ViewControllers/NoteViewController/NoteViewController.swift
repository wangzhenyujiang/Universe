//
//  NoteViewController.swift
//  Universe
//
//  Created by 王振宇 on 16/4/26.
//  Copyright © 2016年 王振宇. All rights reserved.
//

import UIKit
import KeyboardMan

class NoteViewController: BaseViewController {
    
    @IBOutlet weak var topMenuView: TopMenuView!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTopMenuView()
        
    }
}

extension NoteViewController: OwnsTopMenuViewType {
    
}

extension NoteViewController {
    
    @IBAction func backAction(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}
