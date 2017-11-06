//
//  SecondViewController.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/10/31.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, ViewProtocol, ViewModelCast {
    var viewModel: SecondViewModel?
    
    func installViewModel(_ viewModel: ViewModelProtocol) {
        self.viewModel = viewModel as? SecondViewModel
    }
    
    typealias ViewModel = SecondViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Log(self.viewModel?.params)
    }
    deinit {
        Log("dealloc")
    }
}
