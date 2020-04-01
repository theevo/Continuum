//
//  AddPostTableViewController.swift
//  Continuum
//
//  Created by Theo Vora on 3/31/20.
//  Copyright © 2020 studio awaken. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var captionTextField: UITextField!
    
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        // reset Select Image button
        selectImageButton.setTitle("Select Image", for: .normal)
        
        // clean up
        photoImageView.image = nil
        captionTextField.text = ""
    }
    
    
    // MARK: - Actions
    
    @IBAction func selectImageButtonTapped(_ sender: Any) {
        photoImageView.image = #imageLiteral(resourceName: "spaceEmptyState")
        selectImageButton.setTitle("          ", for: .normal)
    }
    
    @IBAction func addPostButtonTapped(_ sender: Any) {
        guard let photo = photoImageView.image,
        let caption = captionTextField.text else { return }
        
        PostController.shared.createPostWith(image: photo, caption: caption) { (_) in
            // TODO: later
        }
        
        // send user to the Post List Table VC
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        
        // send user to the Post List Table VC
        self.tabBarController?.selectedIndex = 0
    }
    
    

    

}
