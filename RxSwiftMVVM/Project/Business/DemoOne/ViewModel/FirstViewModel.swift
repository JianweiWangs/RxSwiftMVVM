//
//  FirstViewModel.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/10/31.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources
import RxSwiftExt
import RxCocoa
import Action

class FirstViewModel: BaseViewModel {
    
    var homeAction: Action<Bool, [Storie]>?
    var rightAction: Action<Void, Void>?
    var leftAction: Action<Void, Void>?
    var bool = false
    
    var data: [Storie]?
    
    init() {
        super.init(StoryBoard("Main", "FirstViewController"))
    }
    
    override func initialize() {

        homeAction = Action<Bool, [Storie]>.init(workFactory: {[unowned self] (value) in
                self.model.request(API.Main, FirstModel.self)
                    .map{ value ? $0.stories ?? [] : $0.stories!.dropLast(5).sorted { $0.id! > $1.id! } }
                    .do(onNext: {
                        self.data = $0
                    })
        })
        
        leftAction = Action<Void, Void>.init(workFactory: {
            Observable<Void>.create({[unowned self] (e) -> Disposable in
                self.homeAction?.execute(self.bool)
                self.bool = !self.bool
                e.onCompleted()
                return Disposables.create()
            })
        })
        
        rightAction = Action<Void, Void>.init(workFactory: {
            Observable<Void>.create({ (e) -> Disposable in
                SecondViewModel()
                    .param("param1")
                    .param(["param2"])
                    .push()
                e.onCompleted()
                return Disposables.create()
            })
        })
    }
}
