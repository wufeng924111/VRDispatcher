//
//  ViewController.swift
//  VRDispaterExample
//
//  Created by veer on 2022/7/28.
//

import UIKit

// MARK: - 调度中间件
public protocol DispatcherExternalInterface {}


public protocol DispatcherSpecificInterface {
    var viewController: UIViewController? { get }
}


public protocol DispatcherActionInterface {
    func callAction()
}


