//
//  SearchViewModel.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 17/02/2024.
//

class SearchViewModel {
    var items: (([SearchItem]) -> Void)?
    
    func searchItem(searchText: String) {
        let item = searchText.isEmpty ? [] : SearchItem.SomeItems
        items?(item)
    }
}
