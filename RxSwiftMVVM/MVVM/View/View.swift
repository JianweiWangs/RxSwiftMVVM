//
//  ViewProtocol.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/10/30.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import Foundation

protocol ViewProtocol {
//    associatedtype ViewModel: ViewModelProtocol
    
    func installViewModel(_ viewModel: ViewModelProtocol)
}

