//
//  ModelProtocol.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/10/30.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import Foundation
import HandyJSON
import Moya
import RxSwift
protocol ModelAbstract {
    associatedtype JsonFormat: HandyJSON
    associatedtype APIFormat: TargetType
    func request(_ type: APIFormat, _ model: JsonFormat) -> Observable<JsonFormat>
}


