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
    
    lazy var currentStoryboard: UIStoryboard = {
        return UIStoryboard(name: "Main", bundle: nil)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchViewController.delegate = self
        
        searchController = UISearchController(searchResultsController: searchViewController)
        searchController.searchBar.placeholder = "Search Products"
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        
        navigationItem.searchController = searchController
    }
    
    private func getSearchViewController() -> SearchViewController {
        return currentStoryboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
    }
    
    private func getDetailViewController(viewModel: SearchItem) -> DetailViewController {
        return currentStoryboard.instantiateViewController(identifier: "DetailViewController") { coder in
            DetailViewController(coder: coder, viewModel: viewModel)
        }
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let item = searchText.isEmpty ? [] : SearchItem.SomeItems
        searchViewController.setSearchItems(item)
    }
}

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        searchController.showsSearchResultsController = true
    }
}

extension HomeViewController: SearchResultDelegate {
    func didSelect(item: SearchItem) {
        searchController.dismiss(animated: true) {
            self.searchController.isActive = false
            
            let detailViewController = self.getDetailViewController(viewModel: item)
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
