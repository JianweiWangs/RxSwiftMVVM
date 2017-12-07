//
//  ViewModelProtocol.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/10/30.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import Foundation

protocol ViewModelProtocol {
    var service: ViewModelService {get}
    var params: [Any?] {get}
    var storyBoard: StoryBoard {get}
    func push(_ animated: Bool)
    func pop(_ animated: Bool)
    func present(_ animated: Bool, _ completion: (() -> Void)?)
    func dismiss(_ animated: Bool,  _ completion: (() -> Void)?)
    func initialize()
}

