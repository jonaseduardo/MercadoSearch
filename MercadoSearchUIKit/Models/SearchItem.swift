//
//  SearchItem.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 17/02/2024.
//

import Foundation

struct SearchItem {
    let name: String
    let price: String
    
    static var SomeItems: [SearchItem] {
        [SearchItem(name: "uno", price: "100"),
         SearchItem(name: "dos", price: "200"),
         SearchItem(name: "tres", price: "300")]
    }
}
