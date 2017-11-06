//
//  FirstViewController.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/10/31.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//
 

import UIKit
import Moya
import RxSwift
import RxCocoa
import RxDataSources
class FirstViewController: UIViewController, ViewProtocol, ViewModelCast {
    typealias ViewModel = FirstViewModel
    var viewModel: FirstViewModel?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "知乎日报"
        
        var rightBarItem = UIBarButtonItem(title: "跳转", style: .plain, target: nil, action: nil)
        rightBarItem.rx.action = self.viewModel?.rightAction
        self.navigationItem.rightBarButtonItem = rightBarItem
        
        self.viewModel?
            .homeAction?
            .execute(())
            .subscribe({ (event) in
                _ = event.element?
                    .map({ (storie) -> Void in
                        Log(storie.title)
                    })
            }).disposed(by: self.rx.disposeBag)
        
    }
    
    
    func installViewModel(_ viewModel: ViewModelProtocol) {
        self.viewModel = viewModel as? FirstViewModel
    }
}

