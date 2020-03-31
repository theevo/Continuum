//
//  Post.swift
//  Continuum
//
//  Created by theevo on 3/31/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class Post {
    var photoData: Data?
    var timestamp: Date
    var caption: String
    var comments: [Comment]
    
    var photo: UIImage? {
        get {
            guard let photoData = photoData else { return nil }
            
            return UIImage(data: photoData)
        }
        set {
            photoData = newValue?.jpegData(compressionQuality: 0.5)
        }
    }
    
    init(photo: UIImage,
         caption: String,
         timestamp: Date = Date(),
         comments: [Comment] = []) {
        self.caption = caption
        self.timestamp = timestamp
        self.comments = comments
        
        self.photo = photo // must be last, because this is computed property
    }
}
