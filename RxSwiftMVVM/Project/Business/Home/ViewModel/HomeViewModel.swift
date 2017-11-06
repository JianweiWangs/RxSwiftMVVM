//
//  HomeViewModel.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/10/31.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import UIKit

class HomeViewModel: BaseViewModel {
    let firstViewModel = FirstViewModel()
    let secondViewModel = SecondViewModel()
    init() {
        super.init(StoryBoard("Main", "HomeViewController"))
    }
    
}
