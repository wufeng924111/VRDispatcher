//
//  ViewController.swift
//  VRDispaterExample
//
//  Created by veer on 2022/7/28.
//

import UIKit
import VRDispatcher

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        let pushBtn = UIButton(type: .custom)
        pushBtn.setTitle("点击跳转A组件页面", for: .normal)
        pushBtn.setTitleColor(.black, for: .normal)
        pushBtn.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 30)
        pushBtn.addTarget(self, action: #selector(onPushTest), for: .touchUpInside)
        view.addSubview(pushBtn)
        
        let actionBtn = UIButton(type: .custom)
        actionBtn.setTitle("点击调用A组件方法", for: .normal)
        actionBtn.setTitleColor(.black, for: .normal)
        actionBtn.frame = CGRect(x: 0, y: 140, width: view.frame.width, height: 30)
        actionBtn.addTarget(self, action: #selector(onCallActionTest), for: .touchUpInside)
        view.addSubview(actionBtn)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 点我跳转A组件的Vc
        let _ = Dispather.open(AModuleDispather.page1)
    }
    
    // MARK: - action
    @objc func onPushTest() {
        let _ = Dispather.open(AModuleDispather.page1)
    }
    
    @objc func onCallActionTest() {
        Dispather.action(of: AModuleActionDispather.funtion1(param1: "外面传过来的参数", param2: 100))
    }
}

