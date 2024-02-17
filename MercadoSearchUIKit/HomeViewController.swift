//
//  HomeViewController.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 17/02/2024.
//

import UIKit

class HomeViewController: UIViewController {
    var searchController: UISearchController!
    lazy var searchViewController = getSearchViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController = UISearchController(searchResultsController: searchViewController)
        searchController.searchBar.placeholder = "Search Products"
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
    }
    
    private func getSearchViewController() -> SearchViewController {
        let bundle = Bundle(for: SearchViewController.self)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        
        return storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchViewController.setSearchItems(SearchItem.SomeItems)
    }
}

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchController.showsSearchResultsController = true
    }
}
