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
import Action
class FirstViewModel: BaseViewModel {
    
    var homeAction: Action<Void, [Storie]>?
    var rightAction: Action<Void, Void>?
    init() {
        super.init(StoryBoard("Main", "FirstViewController"))
    }
    override func initialize() {
        homeAction = Action<Void, [Storie]>.init(workFactory: {[unowned self] in
            self.model.request(API.Main, FirstModel.self).map{$0.stories ?? []}
        })
        rightAction = Action<Void, Void>.init(workFactory: {
            Observable<Void>.create({ (e) -> Disposable in
                SecondViewModel()
                    .param("param")
                    .push()
                e.onCompleted()
                return Disposables.create {
                    
                }
            })
        })
    }
}
