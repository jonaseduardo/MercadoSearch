//
//  ViewController.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 17/02/2024.
//

import UIKit

class ViewController: UIViewController {
    var searchController: UISearchController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search Products"
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchController.showsSearchResultsController = true
    }
}
