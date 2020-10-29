//
//  Post.swift
//  DeveemTestManager
//
//  Created by User on 10/29/20.
//

import Foundation

class Post: Decodable {
    
    private var id: Int?
    private var userId: Int?
    private var title: String?
    private var body: String?
    
    enum CodingKeys: String, CodingKey {
        case id, userId, title, body
    }
    
    func getId() -> Int {
        return id ?? 0
    }
    
    func getUserID() -> Int {
        return userId ?? 0
    }
    
    func getTitle() -> String {
        return title ?? ""
    }
    
    func getBody() -> String {
        return body ?? ""
    }
}
