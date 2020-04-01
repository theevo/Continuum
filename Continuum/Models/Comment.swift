//
//  Comment.swift
//  Continuum
//
//  Created by Theo Vora on 3/31/20.
//  Copyright © 2020 studio awaken. All rights reserved.
//

import Foundation

class Comment {
    let text: String
    let timestamp: Date
    weak var post: Post?
    
    init(text: String, timestamp: Date = Date(), post: Post) {
        self.text = text
        self.timestamp = timestamp
        self.post = post
    }
}
