//
//  CommentTableViewController.swift
//  DeveemTestManager
//
//  Created by User on 10/29/20.
//

import Foundation
import UIKit

class CommentTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var toolBar: UIToolbar!
    
    private var comments = [Comment]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    var postId : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CommentTVCell")
        getCommentsByID(id: postId)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        toolBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        toolBar.isHidden = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentTVCell", for: indexPath)
        cell.textLabel?.text = comments[indexPath.row].getBody()
        cell.textLabel?.numberOfLines = 10
        return cell
    }
    
    private func getCommentsByID(id: Int) {
        ServiceManager.instance.getCommentsByID(postID: postId) { (data) in
            guard let commentsNotNil = data else { return }
            
            guard let comments = try? JSONDecoder().decode([Comment].self, from: commentsNotNil) else { return }
            self.comments.append(contentsOf: comments)
        }
    }
  
    @IBAction func addComment(_ sender: UIBarButtonItem) {
        toolBar.isHidden = true
        let vc = UIStoryboard(name: Constants.MAIN_STORYBOARD, bundle: nil).instantiateViewController(withIdentifier: "AddCommentViewController") as! AddCommentViewController
        vc.delegate = self
        self.addChild(vc)
        vc.view.frame = view.frame
        self.tableView.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
}
extension CommentTableViewController: AddCommentDelegate {
    func addComment(commentAction comment: Comment) {
        self.comments.append(comment)
        self.toolBar.isHidden = false
        self.tableView.reloadData()
    }
}
