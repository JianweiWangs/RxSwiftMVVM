//
//  NavigationControllerStack.swift
//  RxSwiftMVVM
//
//  Created by 王健伟 on 2017/10/30.
//  Copyright © 2017年 JianweiWang. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
final class NavigationControllerStack {

    static let instance = NavigationControllerStack.init()
    
    private let _service: ViewModelService
    
    private let tag = DisposeBag()
    
    var navigationStack: Array<UINavigationController>
    
    private init() {
        _service = Service.instance
        navigationStack = Array<UINavigationController>()
        registerNavigationHooks()
    }
    static func initialize() {
       _ = NavigationControllerStack.instance
    }
}


// MARK: - stack operate
extension NavigationControllerStack {
    
    private func registerNavigationHooks() {
        
        _service.pushSubject
            .bind { (tuple) in
                let (viewModel, animated) = tuple as! (ViewModelProtocol, Bool)
                let viewController = Router.viewController(viewModel ) as! UIViewController
                self.navigationStack.last?.pushViewController(viewController, animated: animated)
            }.disposed(by: tag)
        
        _service.popSubject
            .bind { (tuple) in
                let (animated) = tuple as! (Bool)
                self.navigationStack.last?.popViewController(animated: animated)
            }.disposed(by: tag)
        
        _service.popRootSubject
            .bind { (tuple) in
                let (animated) = tuple as! (Bool)
                self.navigationStack.last?.popToRootViewController(animated: animated)
            }.disposed(by: tag)
        
        _service.presentSubject
            .bind { (tuple) in
                let (viewModel, animated, completion) = tuple as! (ViewModelProtocol, Bool, (() -> Void)?)
                var viewController = Router.viewController(viewModel) as! UIViewController
                if !viewController.isKind(of: UINavigationController.self) {
                    viewController = UINavigationController(rootViewController: viewController)
                }
                self.navigationStack.last?.present(viewController, animated: animated, completion: completion)
                NavigationControllerStack.push(viewController as! UINavigationController)
            }.disposed(by: tag)
        
        _service.dismissSubject
            .bind { (tuple) in
                let (animated, completion) = tuple as! (Bool, (() -> Void)?)
                self.navigationStack.last?.dismiss(animated: animated, completion: completion)
                NavigationControllerStack.pop()
            }.disposed(by: tag)
        
        _service.resetSubject
            .bind { (tuple) in
                self.navigationStack.removeAll()
                let (viewModel) = tuple as! (ViewModelProtocol)
                let viewController = Router.viewController(viewModel)
                let window = (UIApplication.shared.delegate as! AppDelegate).window
                window?.rootViewController = (viewController as! UIViewController)
            }.disposed(by: tag)
        
    }
    
    public static func push(_ navigationController: UINavigationController) {
        let stack = NavigationControllerStack.instance
        if stack.navigationStack.contains(navigationController) {
            return
        }
        stack.navigationStack.append(navigationController)
    }
    @discardableResult public static func pop() -> UINavigationController {
        let stack = NavigationControllerStack.instance
        return stack.navigationStack.removeLast()
    }
}

// MARK: - some unpack method
extension NavigationControllerStack {
    static func currentViewController() -> UIViewController {
        let stack = NavigationControllerStack.instance
        assert(stack.navigationStack.count > 0, "there was not any viewcontroller")
        return (stack.navigationStack.last?.viewControllers.last)!
    }
    static func currentNavigationViewController() -> UINavigationController {
        let stack = NavigationControllerStack.instance
        assert(stack.navigationStack.count > 0, "there was not any viewcontroller")
        return stack.navigationStack.last!
    }
}
