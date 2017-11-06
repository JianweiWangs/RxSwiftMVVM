//
//  Log.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/10/30.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import Foundation

func Log<T>(_ message:T, file: String = #file, function: String = #function, line: Int = #line) {
    #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        print("")
        print("----LOGBEGAN--- \(fileName): \(line) \(function)--------")
        print("\(dateString) \(message)")
        print("----LOGEND-----")
        
    #endif
}
