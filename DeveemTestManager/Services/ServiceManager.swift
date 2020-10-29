//
//  Services.swift
//  DeveemTestManager
//
//  Created by User on 10/29/20.
//

import Foundation
import Alamofire

class ServiceManager: NSObject {
    
    static let instance = ServiceManager()
    
    func getPosts(completed:@escaping (Data?)-> Void) {
        let url = Constants.postsUrl
        Alamofire.request(url).responseJSON { (response) in
            switch (response.result) {
            case .success:
                completed(response.data)
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        }
    }
    
    func getCommentsByID(postID: Int, completed: @escaping (Data?) -> Void) {
        let url = "\(Constants.commentsUrl)=\(postID)"
        Alamofire.request(url).responseJSON { (response) in
            switch (response.result) {
            case .success:
                completed(response.data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
