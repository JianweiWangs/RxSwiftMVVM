//
//  FirstModel.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/10/31.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import Foundation
import HandyJSON
class FirstModel: HandyJSON {
    required init() {}
    var date: String?
    var stories: [Storie]?
    var top_stories: [Top]?
    
}
class Storie: HandyJSON {
    required init() {}
    var ga_prefix: String?
    var id: String?
    var images: [String]?
    var title: String?
    var type: String?
}
class Top: HandyJSON {
    required init() {}
    var ga_prefix: String?
    var id: String?
    var image: String?
    var title: String?
    var type: String?
}
