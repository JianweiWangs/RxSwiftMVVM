//
//  FirstModel.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/10/31.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import Foundation
import HandyJSON
struct FirstModel: HandyJSON {
    init() {
        
    }
    var date: String?
    var stories: [Storie]?
    var top_stories: [Top]?
    
}
struct Storie: HandyJSON {
    
    var ga_prefix: String?
    var id: Int?
    var images: [String]?
    var title: String?
    var type: String?
}
struct Top: HandyJSON {
    
    var ga_prefix: String?
    var id: String?
    var image: String?
    var title: String?
    var type: String?
}
