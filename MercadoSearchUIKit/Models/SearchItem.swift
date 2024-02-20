//
//  SearchItem.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 17/02/2024.
//

import Foundation

public struct SearchItem: Equatable {
    let name: String
    let condition: String
    let quantity: String
    let price: String
    
    public init(name: String, condition: String, quantity: String, price: String) {
        self.name = name
        self.condition = condition
        self.quantity = quantity
        self.price = price
    }
    
    static var SomeItems: [SearchItem] {
        [SearchItem(name: "uno", condition: "nuevo", quantity: "1", price: "100"),
         SearchItem(name: "dos", condition: "nuevo", quantity: "1", price: "200"),
         SearchItem(name: "tres", condition: "nuevo", quantity: "1", price: "300")]
    }
}
