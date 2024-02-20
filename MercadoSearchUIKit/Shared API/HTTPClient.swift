//
//  HTTPClient.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 20/02/2024.
//

import Foundation

import Foundation

public protocol HTTPClient {
    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>

    func get(from url: URL, completion: @escaping (Result) -> Void)
}
