//
//  AddCommentViewController.swift
//  DeveemTestManager
//
//  Created by User on 10/29/20.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift

protocol AddCommentDelegate {
    func addComment(commentAction comment: Comment)
}

class AddCommentViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var commentTextView: UITextView!
    
    var comment = Comment()
    
    var delegate: AddCommentDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentTextView.delegate = self
        commentTextView.text = "Type text"
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        self.view.backgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.isToolbarHidden = true
    }
    
    @IBAction func tapedAddCommentButton(_ sender: UIButton) {
        
        comment.setBody(body: commentTextView.text)
        comment.setName(name: nameTextField.text ?? "")
        comment.setEmail(email: emailTextField.text ?? "")
        
        if let delegate = self.delegate {
            delegate.addComment(commentAction: comment)
        }
        self.view.removeFromSuperview()
    }
}
extension AddCommentViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Type text" {
            textView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Type text"
        }
    }
}
