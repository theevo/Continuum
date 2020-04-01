//
//  PostListTableViewController.swift
//  Continuum
//
//  Created by Theo Vora on 3/31/20.
//  Copyright © 2020 studio awaken. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var resultsArray: [Post] = []
    var isSearching: Bool = false
    var dataSource: [SearchableRecord] {
        get {
            isSearching ? resultsArray : PostController.shared.posts
        }
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var captionsSearchBar: UISearchBar!
    
    
    // MARK: - Lifecycle Methods
    
    override func viewWillAppear(_ animated: Bool) {
        resultsArray = PostController.shared.posts
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        captionsSearchBar.delegate = self

    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
        
        let post = dataSource[indexPath.row] as? Post
        
        cell.post = post
        
        return cell
    }
    

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPostDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? PostDetailTableViewController
                else { return }
            
            let post = dataSource[indexPath.row] as? Post
            
            destinationVC.post = post
        }
    }
} // end class


extension PostListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if !searchText.isEmpty {
            // search for captions?
            resultsArray = PostController.shared.posts.filter { $0.matchesSearchTerm(searchTerm: searchText) }
        } else {
            resultsArray = PostController.shared.posts
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        captionsSearchBar.text = ""
        resultsArray = PostController.shared.posts
        tableView.reloadData()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false
    }
} // end extension
