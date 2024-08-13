//
//  RouterProtocol.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 17/04/2021.
//

import UIKit

// MARK: Router protocols
protocol RouterProtocol {
    
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)
    func present(_ module: Presentable?, withNavigationController: Bool, isFullScreen: Bool)
    
    func push(_ module: Presentable?)
    func push(_ module: Presentable?, hideBottomBar: Bool)
    func push(_ module: Presentable?, animated: Bool)
    func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?)
    func push(_ module: Presentable?, animated: Bool, hideBottomBar: Bool, completion: (() -> Void)?)
    
    func popModule()
    func popModule(animated: Bool)
    
    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> Void)?)
    
    func popToRootModule(animated: Bool)
}


class Router: RouterProtocol {
    
    private weak var rootController: UINavigationController?
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    func present(_ module: Presentable?) {
        present(module, animated: true)
    }
    
    func present(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        rootController?.present(controller, animated: animated, completion: nil)
    }
    
    func presdent(_ module: Presentable?, animated: Bool, withNavigationController: Bool) {
        guard let controller = module?.toPresent() else { return }
        if withNavigationController {
            let navVC = UINavigationController(rootViewController: controller)
            navVC.modalPresentationStyle = .none
            rootController?.present(navVC, animated: animated, completion: nil)
        } else {
            rootController?.present(controller, animated: animated, completion: nil)
        }
    }
    
    func present(_ module: Presentable?, withNavigationController: Bool, isFullScreen: Bool) {
        guard let controller = module?.toPresent() else { return }
        var vc = controller
        if withNavigationController {
            vc = UINavigationController(rootViewController: controller)
        }
        
        if isFullScreen {
            vc.modalPresentationStyle = .fullScreen
        }
        rootController?.present(vc, animated: true, completion: nil)
    }
    
    func push(_ module: Presentable?) {
        push(module, animated: true)
    }
    
    func push(_ module: Presentable?, hideBottomBar: Bool) {
        push(module, animated: true, hideBottomBar: hideBottomBar, completion: nil)
    }
    
    func push(_ module: Presentable?, animated: Bool) {
        push(module, animated: animated, completion: nil)
    }
    
    func push(_ module: Presentable?, animated: Bool, completion: (() -> Void)?) {
        push(module, animated: animated, hideBottomBar: false, completion: completion)
    }
    
    func push(_ module: Presentable?, animated: Bool, hideBottomBar: Bool, completion: (() -> Void)?) {
        guard
            let controller = module?.toPresent(),
            (controller is UINavigationController == false)
            else { assertionFailure("Deprecated push UINavigationController."); return }
        
        controller.hidesBottomBarWhenPushed = hideBottomBar
        rootController?.pushViewController(controller, animated: animated)
    }
    
    func popModule() {
        popModule(animated: true)
    }
    
    func popModule(animated: Bool) {
        rootController?.popViewController(animated: animated)
    }
    
    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }
    
    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        rootController?.dismiss(animated: animated, completion: completion)
    }
    
    func popToRootModule(animated: Bool) {
        rootController?.popToRootViewController(animated: animated)
    }
    
    func toPresent() -> UIViewController? {
        rootController
    }
    
}
