//
//  DataModel.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/10/31.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import UIKit
import HandyJSON
class DataModel<T> : HandyJSON {
    var code: String?
    var message: String?
    var data: T?
    func isSuccess() -> Bool {
        guard let _code = code else {
            return false
        }
        return Int.init(_code)! == 0
    }
    required init() {}
}
