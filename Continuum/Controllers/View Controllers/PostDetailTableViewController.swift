//
//  PostDetailTableViewController.swift
//  Continuum
//
//  Created by Theo Vora on 3/31/20.
//  Copyright © 2020 studio awaken. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Actions
    
    @IBAction func commentButtonTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "Comment", message: "Write your comment", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.delegate = self
            textField.placeholder = "Great photo!"
            textField.autocorrectionType = .yes
            textField.autocapitalizationType = .sentences
        }
        
        let saveAction = UIAlertAction(title: "OK", style: .default) { (_) in
            guard let commentText = alert.textFields?.first?.text,
            !commentText.isEmpty else { return }
            
            if let post = self.post {
                PostController.shared.addComment(text: commentText, to: post) { (_) in
                    // TODO: later
                }
                self.tableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
    }
    
    @IBAction func followPostButtonTapped(_ sender: Any) {
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post?.comments.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
        
        let comment = post?.comments[indexPath.row]
        
        cell.textLabel?.text = comment?.text
        cell.detailTextLabel?.text = comment?.timestamp.formatDate()

        return cell
    }
    
    
    // MARK: - Helper Functions
    
    func updateViews(){
        photoImageView.image = post?.photo
        tableView.reloadData()
    }
    
} // end class


// MARK: - TextField Delegate

extension PostDetailTableViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
