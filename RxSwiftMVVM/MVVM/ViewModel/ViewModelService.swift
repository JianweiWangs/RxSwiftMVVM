//
//  ViewModelService.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/10/30.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import Foundation
import RxSwift
protocol ViewModelService {
    var pushSubject: PublishSubject<(Any)> {get}
    var popSubject: PublishSubject<(Any)> {get}
    var popRootSubject: PublishSubject<(Any)> {get}
    var presentSubject: PublishSubject<(Any)> {get}
    var dismissSubject: PublishSubject<(Any)> {get}
    var resetSubject: PublishSubject<(Any)> {get}
    var model: Model {get}
    func pushViewModel(_ : ViewModelProtocol, _ : Bool)
    func popViewModel(_ : Bool)
    func popToRootViewModel(_ : Bool)
    func presentViewModel(_ : ViewModelProtocol, _ : Bool, _ : (() -> Void)?)
    func dismissViewModel(_ : Bool, _ : (() -> Void)?)
    func resetRootViewModel(_ : ViewModelProtocol)
}


