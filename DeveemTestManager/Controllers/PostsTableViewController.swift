//
//  PostsTableViewController.swift
//  DeveemTestManager
//
//  Created by User on 10/29/20.
//

import Foundation
import UIKit
import Alamofire

class PostsTableViewController: UITableViewController {
    
    private var posts = [Post]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PostTVCell")
        getPosts()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTVCell", for: indexPath)
        cell.textLabel?.text = posts[indexPath.row].getTitle()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CommentTableViewController") as! CommentTableViewController
        vc.postId = posts[indexPath.row].getId()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func getPosts() {
        ServiceManager.instance.getPosts { (data) in
            guard let dataNotNil = data else { return }
            
            guard let posts = try? JSONDecoder().decode([Post].self, from: dataNotNil) else { return }
            if posts.count > 30 {
                for i in 0..<30 {
                    self.posts.append(posts[i])
                }
            } else {
                self.posts.append(contentsOf: posts)
            }
        }
    }
}
