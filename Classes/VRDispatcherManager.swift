//
//  ViewController.swift
//  VRDispaterExample
//
//  Created by veer on 2022/7/28.
//

import UIKit

/// 这里可以用static或者单例
public var Dispather: DispatherManager  = DispatherManager()

public class DispatherManager {
    
    public func open(_ target: DispatcherExternalInterface) -> UIViewController? {
        
        guard let vc = self.viewController(of: target) else { return nil }
        guard let navigationController = UIViewController.topViewController?.navigationController else { return nil }
        navigationController.pushViewController(vc, animated: true)
        return vc
    }
    
    public func callMethodWith(_ target : DispatcherExternalInterface) {
        print("😊Call Target: \(target)")
        self.action(of: target)
    }
}

extension DispatherManager {
    
    public func viewController(of target: DispatcherExternalInterface) -> UIViewController? {
        guard let t = target as? DispatcherSpecificInterface else {
            print("DISPATCHER WARNINIG: \(target) does not conform to DispatcherSpecificInterface")
            return nil
        }
        guard let viewController = t.viewController else { return nil }
        return viewController
    }
    
    public func action(of target: DispatcherExternalInterface) {
        guard let t = target as? DispatcherActionInterface else {
            print("⚠️WARNINIG: \(type(of: target)) does not conform to DispatcherSpecificInterface")
            return
        }
        t.callAction()
        print("😊Action: \(String(describing: action)) <==> \(type(of: target)).\(target)")
    }
}


extension UIViewController {
    
    private class var sharedApplication: UIApplication? {
        let selector = NSSelectorFromString("sharedApplication")
        return UIApplication.perform(selector)?.takeUnretainedValue() as? UIApplication
    }
    
    @objc open class var topViewController: UIViewController? {
        guard let rootViewController = self.sharedApplication?.keyWindow?.rootViewController else { return nil }
        return self.topViewController(of: rootViewController)
    }
    
    @objc open class var topRootViewController: UIViewController? {
        guard let rootViewController = self.topViewController else { return nil }
        
        // UINavigationController
        if let navigationController = rootViewController.navigationController {
            return navigationController
        }
        // UITabBarController
        if let tabBarController = rootViewController.tabBarController {
            return tabBarController
        }
        return rootViewController
    }
    
    open class func topViewController(of viewController: UIViewController?) -> UIViewController? {
        // UINavigationController
        if let navigationController = viewController as? UINavigationController,
            let visibleViewController = navigationController.visibleViewController {
            return self.topViewController(of: visibleViewController)
        }
        // UITabBarController
        if let tabBarController = viewController as? UITabBarController,
            let selectedViewController = tabBarController.selectedViewController {
            return self.topViewController(of: selectedViewController)
        }
        // presented view controller
        if let presentedViewController = viewController?.presentedViewController {
            return self.topViewController(of: presentedViewController)
        }
        return viewController
    }
}
