//
//  API.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/11/2.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import Foundation
import Moya
enum API {
    case Main
}

extension API: TargetType {
    
    var baseURL: URL {
        return URL(string: "http://news-at.zhihu.com")!
    }
    
    var path: String {
        switch self {
        case .Main:
            return "/api/4/stories/latest"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .Main:
            return .get
        }
    }
    
    var sampleData: Moya.Data {
        switch self {
        case .Main:
            return "".data(using: String.Encoding.utf8)!
        }
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"];
    }
    
    
}

