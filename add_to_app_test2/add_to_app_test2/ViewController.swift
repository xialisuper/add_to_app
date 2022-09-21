//
//  ViewController.swift
//  add_to_app_test2
//
//  Created by lswlkj on 2022/9/20.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

class ViewController: UIViewController {

    
    lazy var nextButton: UIButton = {
        let btn: UIButton = UIButton.init(type: .contactAdd)
        btn.addTarget(self, action: #selector(handleNextButtonClick), for: .touchUpInside)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        return btn
    }()
    
    lazy var secondBtn: UIButton = {
        let btn: UIButton = UIButton.init(type: .contactAdd)
        btn.addTarget(self, action: #selector(handleSecondBtnClick), for: .touchUpInside)
        btn.frame = CGRect(x: 100, y: 200, width: 100, height: 100)
        return btn
    }()
    
    lazy var thirdBtn: UIButton = {
        let btn: UIButton = UIButton.init(type: .contactAdd)
        btn.addTarget(self, action: #selector(handleThirdButtonClick), for: .touchUpInside)
        btn.frame = CGRect(x: 100, y: 300, width: 100, height: 100)
        return btn
    }()
    
    @objc private func handleThirdButtonClick() {
        let vc = NativeViewController.init()
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
    }
    
    @objc private func handleNextButtonClick() {
        
        if let engine = (UIApplication.shared.delegate as! AppDelegate).firstEng {
            GeneratedPluginRegistrant.register(with: engine)
            let flutterViewController = FlutterViewController(engine: engine, nibName: nil, bundle: nil)
            present(flutterViewController, animated: true)
        }
        
    }
    
    @objc private func handleSecondBtnClick() {
        
//        let engs = (UIApplication.shared.delegate as! AppDelegate).engines
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).engines.makeEngine(withEntrypoint: "runSecondEntry", libraryURI: nil)
        GeneratedPluginRegistrant.register(with: flutterEngine)

        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        present(flutterViewController, animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(nextButton)
        view.addSubview(secondBtn)
        view.addSubview(thirdBtn)
        
    }


}

