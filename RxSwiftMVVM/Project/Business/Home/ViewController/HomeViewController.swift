//
//  HomeViewController.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/10/31.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import UIKit
import NSObject_Rx
import RxCocoa

class HomeViewController: BaseTabBarViewController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewModel = (self.viewModel as! HomeViewModel)
        
        let firstViewController: FirstViewController = Router.viewController((viewModel.firstViewModel)) as! FirstViewController
        
        let firstItem = UITabBarItem(tabBarSystemItem:.bookmarks, tag: 0)
        
        let firstNav = UINavigationController(rootViewController: firstViewController)
        
        firstNav.tabBarItem = firstItem
        
        let secondViewController: SecondViewController = Router.viewController((viewModel.secondViewModel)) as! SecondViewController
        
        let secondItem = UITabBarItem(tabBarSystemItem:.favorites, tag: 0)
        
        let secondNav = UINavigationController(rootViewController: secondViewController)
        
        secondNav.tabBarItem = secondItem
        
        self.vmTabBarController.viewControllers = [firstNav, secondNav]
        
        NavigationControllerStack.push(firstNav)
        
        self.vmTabBarController.delegate = self
        
        self.vmTabBarController
            .rx.didSelect
            .asObservable()
            .bind { (viewController) in
                NavigationControllerStack.pop()
                NavigationControllerStack.push(viewController as! UINavigationController)
            }.disposed(by: self.vmTabBarController.rx.disposeBag)

    }
}
