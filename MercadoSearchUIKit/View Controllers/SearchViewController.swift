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

class SearchViewController: UITableViewController {
    private var searchItems: [SearchItem] = []
    var delegate: SearchResultDelegate?
    
    func setSearchItems(_ searchItems: [SearchItem]) {
        self.searchItems = searchItems
        tableView.reloadData()
    }
    
    func setError(error: SearchError) {
        // Mostrar mensaje de error
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchCell = tableView.dequeueReusableCell()
        let searchItem = searchItems[indexPath.row]
        
        cell.searchlabel.text = searchItem.name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let searchItem = searchItems[indexPath.row]
        delegate?.didSelect(item: searchItem)
    }
}
