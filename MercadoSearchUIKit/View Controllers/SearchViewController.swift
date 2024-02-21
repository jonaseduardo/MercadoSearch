//
//  SearchViewController.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 17/02/2024.
//

import UIKit

protocol SearchResultDelegate: AnyObject {
  func didSelect(item: SearchItem)
}

final class SearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorLabel: UILabel!
    
    private var searchItems: [SearchItem] = []
    weak var delegate: SearchResultDelegate?
    
    func setSearchItems(_ searchItems: [SearchItem]) {
        self.searchItems = searchItems
        showTableView()
        tableView.reloadData()
    }
    
    func setError(error: SearchError) {
        showErrorView()
        errorLabel.text = error.message
    }
    
    private func showTableView() {
        tableView.isHidden = false
        errorLabel.isHidden = true
    }
    
    private func showErrorView() {
        errorLabel.isHidden = false
        tableView.isHidden = true
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchCell = tableView.dequeueReusableCell()
        let searchItem = searchItems[indexPath.row]
        
        cell.searchlabel.text = searchItem.name
        
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let searchItem = searchItems[indexPath.row]
        delegate?.didSelect(item: searchItem)
    }
}
