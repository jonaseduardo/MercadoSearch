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
    let quantity: Int
    let price: Double
    
    public init(name: String, condition: String, quantity: Int, price: Double) {
        self.name = name
        self.condition = condition
        self.quantity = quantity
        self.price = price
    }
}
