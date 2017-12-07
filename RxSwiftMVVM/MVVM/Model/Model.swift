//
//  Model.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/10/31.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import Foundation
import Moya
import HandyJSON
import RxSwift
final class Model {
    func request<H: HandyJSON, T: TargetType>(_ type: T, _ model: H.Type) -> Observable<H> {
        let mp = MoyaProvider<T>()
        let ob = mp
            .rx.request(type)
            .asObservable()
            .map(model)
        return ob
    }
}
