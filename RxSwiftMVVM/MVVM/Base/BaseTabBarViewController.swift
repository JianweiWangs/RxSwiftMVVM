//
//  TabBarViewController.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/10/31.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import UIKit

class BaseTabBarViewController: BaseViewController {

    let vmTabBarController: UITabBarController = UITabBarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vmTabBarController.view.frame = view.bounds
        addChildViewController(vmTabBarController)
        view.addSubview(vmTabBarController.view)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
