//
//  Service.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/10/30.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import Foundation
import RxSwift
struct Service {
    static let instance = Service.init()
    let model: Model
    private let _pushSubject: PublishSubject<(Any)>
    private let _popSubject: PublishSubject<(Any)>
    private let _popRootSubject: PublishSubject<(Any)>
    private let _presentSubject: PublishSubject<(Any)>
    private let _dismissSubject: PublishSubject<(Any)>
    private let _resetSubject: PublishSubject<(Any)>
    
    private init() {
        _pushSubject = PublishSubject<(Any)>()
        _popSubject = PublishSubject<(Any)>()
        _popRootSubject = PublishSubject<(Any)>()
        _presentSubject = PublishSubject<(Any)>()
        _dismissSubject = PublishSubject<(Any)>()
        _resetSubject = PublishSubject<(Any)>()
        model = Model()
    }
}

extension Service: ViewModelService {
    var pushSubject: PublishSubject<(Any)> {
        return _pushSubject
    }
    
    var popSubject: PublishSubject<(Any)> {
        return _popSubject
    }
    
    var popRootSubject: PublishSubject<(Any)> {
        return _popRootSubject
    }
    
    var presentSubject: PublishSubject<(Any)> {
        return _presentSubject
    }
    
    var dismissSubject: PublishSubject<(Any)> {
        return _dismissSubject
    }
    
    var resetSubject: PublishSubject<(Any)> {
        return _resetSubject
    }
    
    
    func pushViewModel(_ viewModel: ViewModelProtocol, _ animated: Bool) {
        _pushSubject.onNext((viewModel, animated))
    }

    func popViewModel(_ animated: Bool) {
        _popSubject.onNext((animated))
    }

    func popToRootViewModel(_ animated: Bool) {
        _popRootSubject.onNext((animated))
    }

    func presentViewModel(_ viewModel: ViewModelProtocol, _ animated: Bool, _ completion: (() -> Void)? = nil) {
        _presentSubject.onNext((viewModel, animated, completion))
    }

    func dismissViewModel(_ animated: Bool, _ completion: (() -> Void)? = nil) {
        dismissSubject.onNext((animated, completion))
    }

    func resetRootViewModel(_ viewModel: ViewModelProtocol) {
        resetSubject.onNext((viewModel))
    }
}
