//
//  SearchViewController+TestHelpers.swift
//  MercadoSearchUIKitTests
//
//  Created by Jonathan García on 21/02/2024.
//

import UIKit
@testable import MercadoSearchUIKit

extension SearchViewController {
    private var section: Int { 0 }
    
    func numberOfRows() -> Int {
        tableView.numberOfRows(inSection: section)
    }
    
    func searchName(at row: Int) -> String? {
        searchView(at: row)?.searchlabel.text
    }
    
    func simulateTapOnSearchItem(at row: Int) {
        let delegate = tableView.delegate
        let index = IndexPath(row: row, section: section)
        delegate?.tableView?(tableView, didSelectRowAt: index)
    }
    
    var collectionViewIsVisible: Bool {
        !tableView.isHidden
    }
    
    var errorViewIsVisible: Bool {
        !errorLabel.isHidden
    }
    
    var errorMessage: String? {
        errorLabel.text
    }
    
    private func cell(row: Int, section: Int) -> UITableViewCell? {
        guard numberOfRows() > row else {
            return nil
        }
        let ds = tableView.dataSource
        let index = IndexPath(row: row, section: section)
        return ds?.tableView(tableView, cellForRowAt: index)
    }
    
    private func searchView(at row: Int) -> SearchCell? {
        cell(row: row, section: section) as? SearchCell
    }
}
