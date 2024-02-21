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

class SearchViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var searchItems: [SearchItem] = []
    var delegate: SearchResultDelegate?
    
    func setSearchItems(_ searchItems: [SearchItem]) {
        self.searchItems = searchItems
        tableView.reloadData()
    }
    
    func setError(error: SearchError) {
        // Mostrar mensaje de error
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
