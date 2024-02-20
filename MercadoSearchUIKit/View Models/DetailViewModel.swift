//
//  DetailViewModel.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 17/02/2024.
//

import Foundation

struct DetailViewModel {
    let searchItem: SearchItem
    
    var name: String {
        searchItem.name
    }    
    
    var price: String {
        String(searchItem.price)
    }
}
