//
//  NativeViewController.swift
//  add_to_app_test2
//
//  Created by lswlkj on 2022/9/20.
//

import UIKit

class NativeViewController: UIViewController {

    lazy var nextButton: UIButton = {
        let btn: UIButton = UIButton.init(type: .contactAdd)
        btn.addTarget(self, action: #selector(handleNextButtonClick), for: .touchUpInside)
        btn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "源生页面"
        view.addSubview(nextButton)
    }
    
    @objc func handleNextButtonClick() {
        if let engine = (UIApplication.shared.delegate as! AppDelegate).firstEng {
            let api = FlutterBookApi(binaryMessenger: engine.binaryMessenger)
            let auth = Author(name: "xia", age: 33)
            let book = Book(title: "flutter book to display", author: auth)
            api.displayBookDetails(book: book) {
                print("request flutter to display book")
            }

        }
    }
    
}



