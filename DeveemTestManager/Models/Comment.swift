//
//  Comment.swift
//  DeveemTestManager
//
//  Created by User on 10/29/20.
//

import Foundation

class Comment: Decodable {
    
    private var postId : Int?
    private var id : Int?
    private var name : String?
    private var email : String?
    private var body : String?
    
    enum CodingKeys: String, CodingKey {
        case postId, id, name, email, body
    }
    
    func getPostId() -> Int {
        return postId ?? 0
    }
    
    func getId() -> Int {
        return id ?? 0
    }
    
    func getName() -> String {
        return name ?? ""
    }
    
    func getEmail() -> String {
        return email ?? ""
    }
    
    func getBody() -> String {
        return body ?? ""
    }
    
    func setBody(body: String) {
        self.body = body
    }
    
    func setName(name: String) {
        self.name = name
    }
    
    func setEmail(email: String) {
        self.email = email
    }
}
