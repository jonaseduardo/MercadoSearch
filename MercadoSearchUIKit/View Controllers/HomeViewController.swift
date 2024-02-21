//
//  HomeViewController.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 17/02/2024.
//

import UIKit

class HomeViewController: UIViewController {
    var navigateToDetail: ((SearchItem) -> Void)?
    
    let viewModel: SearchViewModel
    let searchViewController: SearchViewController
    let searchController: UISearchController
    
    init?(coder: NSCoder, viewModel: SearchViewModel, searchViewController: SearchViewController) {
        self.viewModel = viewModel
        self.searchViewController = searchViewController
        searchController = UISearchController(searchResultsController: searchViewController)
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with a viewModel and a search controller")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configSearchView()
        configNavigationItem()
        bindViewModel()
    }
    
    private func configSearchView() {
        searchViewController.delegate = self
        searchController.searchBar.placeholder = "Search Products"
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
    }
    
    private func configNavigationItem() {
        navigationItem.title = "Mercado Search"
        navigationItem.searchController = searchController
    }
    
    private func bindViewModel() {
        viewModel.onReceiveItems = { [weak self] items in
            self?.searchViewController.setSearchItems(items)
        }
        
        viewModel.onReceiveError = { [weak self] error in
            self?.searchViewController.setError(error: error)
        }
    }
    
    private func restartSearchState() {
        searchController.isActive = false
        searchViewController.setSearchItems([])
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchItem(searchText: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        restartSearchState()
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
            self.restartSearchState()
            self.navigateToDetail?(item)
        }
    }
}
