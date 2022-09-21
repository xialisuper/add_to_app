//
//  AppDelegate.swift
//  add_to_app_test2
//
//  Created by lswlkj on 2022/9/20.
//

import UIKit
import Flutter
import FlutterPluginRegistrant

@main
class AppDelegate: FlutterAppDelegate {

    
    let engines = FlutterEngineGroup(name: "test-group", project: nil)
    var firstEng: FlutterEngine?
    
    lazy var apiEngine: FlutterEngine = {
        let result = FlutterEngine.init(name: "Books")
        // This could be `run` earlier in the app to avoid the overhead of doing it the first time the
        // engine is needed.
        result.run()
        return result
      }()
    
    
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //pre-warm 相应速度快 但是同时内存消耗也增加
        if let eng = (UIApplication.shared.delegate as? AppDelegate)?.engines.makeEngine(withEntrypoint: "runAnotherEntry", libraryURI: nil) {
            
            firstEng = eng
            //channel
            HostBookApiSetup
                .setUp(binaryMessenger: eng.binaryMessenger, api: self)
        }

        
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }


}

