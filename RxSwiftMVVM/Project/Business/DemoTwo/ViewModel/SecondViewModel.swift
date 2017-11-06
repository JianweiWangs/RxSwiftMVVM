//
//  SecondViewModel.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/10/31.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import Foundation
import RxSwift
class SecondViewModel: BaseViewModel {
    
    
    init() {
        super.init(StoryBoard("Main", "SecondViewController"))
    }
    override func initialize() {
    }
}
