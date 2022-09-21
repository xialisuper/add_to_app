//
//  Appdelegate+api.swift
//  add_to_app_test2
//
//  Created by lswlkj on 2022/9/20.
//

import Foundation

extension AppDelegate: HostBookApi {
    
    
    
    func search(keyword: String) -> [Book] {
        let author = Author(name: "xia", age: 18)
        let book = Book(title: "python", author: author)
        
        return [book]
    }
    
    func asyncSearch(keyword: String, completion: @escaping ([Book]) -> Void) {
        
        
        let author1 = Author(name: "xia", age: 18)
        let book1 = Book(title: "python", author: author1)
        
        let author2 = Author(name: "li", age: 20)
        let book2 = Book(title: "java", author: author2)
        
        completion([book1, book2])
        
    }
    
    func searchWithTitle(title: String, completion: @escaping (Author) -> Void) {
        let author = Author(name: "qun", age: 99)
        completion(author)
    }
    
}
