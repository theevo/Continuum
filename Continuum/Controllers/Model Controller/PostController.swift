//
//  PostController.swift
//  Continuum
//
//  Created by Theo Vora on 3/31/20.
//  Copyright © 2020 studio awaken. All rights reserved.
//

import UIKit

class PostController {
    
    // MARK: - Singleton and Source of Truth
    static let shared = PostController()
    var posts: [Post] = []
    
    
    
    // MARK: - CRUD Functions
    
    func addComment(text: String, to post: Post, completion: @escaping (Result<Comment, PostError>) -> Void) {
        let comment = Comment(text: text, post: post)
        post.comments.append(comment)
    }
    
    func createPostWith(image: UIImage, caption: String, completion: @escaping (Result<Post?, PostError>) -> Void) {
        let post = Post(photo: image, caption: caption)
        posts.append(post)
    }
    
    
} // end class
