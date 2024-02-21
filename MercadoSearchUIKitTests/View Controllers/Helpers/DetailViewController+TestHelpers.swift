//
//  DetailViewController+TestHelpers.swift
//  MercadoSearchUIKitTests
//
//  Created by Jonathan García on 21/02/2024.
//

@testable import MercadoSearchUIKit

extension DetailViewController {
    var name: String? {
        nameLabel.text
    }
    
    var price: String? {
        priceLabel.text
    }
    
    var condition: String? {
        conditionLabel.text
    }

    var quantity: String? {
        quantityLabel.text
    }

}
