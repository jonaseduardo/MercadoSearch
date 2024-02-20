//
//  HTTPURLResponse+StatusCode.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 20/02/2024.
//

import Foundation

extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }

    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}

