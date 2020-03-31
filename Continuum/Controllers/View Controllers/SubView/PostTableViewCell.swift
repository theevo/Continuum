//
//  PostTableViewCell.swift
//  Continuum
//
//  Created by theevo on 3/31/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Outlets
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentCountLabel: UILabel!
    
    
    // MARK: - Helper Functions
    
    func updateViews(){
        guard let post = post else { return }
        
        photoImageView.image = post.photo
        captionLabel.text = post.caption
        commentCountLabel.text = "Comments: \(post.comments.count)"
    }
    
}
