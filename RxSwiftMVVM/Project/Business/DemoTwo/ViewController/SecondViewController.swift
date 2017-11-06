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
        if self.viewModel!.params.count > 0 {
            self.navigationItem.title = (self.viewModel?.params[0] as? String)
        } else {
            self.navigationItem.title = "normal"
        }
        // MARK: check method work as normal
        Log(self.navigationController)
        Log(NavigationControllerStack.currentNavigationViewController())
        Log(NavigationControllerStack.currentViewController())
        Log(self)
    }
    deinit {
        Log("dealloc")
    }
}
