//
//  ViewController.swift
//  VRDispaterExample
//
//  Created by veer on 2022/7/28.
//

import UIKit

// MARK: - 调度中心，一个枚举代表一个组件，每个模块可以放单独文件
public enum AModuleDispather: DispatcherExternalInterface {
    case page1
}

public enum AModuleActionDispather: DispatcherExternalInterface {
    case funtion1(param1: String, param2: Int)
}

