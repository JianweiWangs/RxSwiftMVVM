//
//  Observable+HandyJSON.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/10/25.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import HandyJSON


extension Observable {
    func map<T: HandyJSON>(_ type: T.Type) -> Observable<T> {
        return map { response in
            guard let response = response as? Moya.Response else {
                throw RxSwiftMoyaError.ResponseError
            }
            
            guard (200...209) ~= response.statusCode else {
                throw RxSwiftMoyaError.RequestFailedError
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: response.data, options: JSONSerialization.ReadingOptions.init(rawValue: 0)) as! [String: Any] else {
                throw RxSwiftMoyaError.ResponseError
            }
            
            let object = JSONDeserializer<T>.deserializeFrom(dict: json)
            guard let model = object else {
                throw RxSwiftMoyaError.ParseJSONError
            }
            return model
        }
    }
}


enum RxSwiftMoyaError: String {
    case ParseJSONError
    case OtherError
    case ResponseError
    case RequestFailedError
}

extension RxSwiftMoyaError: Swift.Error { }
