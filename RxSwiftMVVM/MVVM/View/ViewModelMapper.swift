//
//  ViewModelMapper.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/11/3.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import Foundation

protocol ViewModelCast {
    associatedtype ViewModel
    var viewModel: ViewModel? {get}
    
}
