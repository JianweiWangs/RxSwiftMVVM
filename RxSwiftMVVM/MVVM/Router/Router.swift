//
//  Router.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/10/30.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import Foundation
import UIKit

enum RouteError: Error {
    case NameSpaceGetError(String)
    case CastClassError
}

struct StoryBoard {
    let name: String
    let id: String
    init(_ name: String, _ id: String) {
        self.name = name
        self.id = id
    }
}

struct Router {
    private init() {}
    static let instance = Router.init()
    
    /// the map func that transform ViewModel to ViewController
    /// apply to code layout
    /// - Parameter viewModel: an obj what ViewModelProtocol constraint
    /// - Returns: viewController: an obj what ViewProtocol constraint
    
    static func viewController(_ viewModel: ViewModelProtocol) -> ViewProtocol  {
        let router = Router.instance
        let storyboard = viewModel.storyBoard
        let viewController = router.viewControllerFromStoryBoard(storyBoardModel: storyboard)
        viewController.installViewModel(viewModel)
        return viewController
    }
}

extension Router {
    private func classNameOf(_ obj: Any) -> String {
        let type = Mirror.init(reflecting: obj)
        let keys = NSStringFromClass(type.subjectType as! AnyClass)
        let key = keys.components(separatedBy: ".").last!
        return key
    }
    
    private func instanceOf(_ cls: AnyClass?) throws -> ViewProtocol {
        guard let clsT = cls as? NSObject.Type else {
            throw RouteError.CastClassError
        }
        return clsT.init() as! ViewProtocol
    }
    
    private func viewControllerFromStoryBoard(storyBoardModel: StoryBoard) -> ViewProtocol {
        let storyBoard = UIStoryboard(name: storyBoardModel.name, bundle: Bundle.main)
        let controller = storyBoard.instantiateViewController(withIdentifier: storyBoardModel.id) as! ViewProtocol
        return controller
    }
}
