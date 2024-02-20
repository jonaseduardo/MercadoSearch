//
//  SearchItemsEndpoint.swift
//  MercadoSearchUIKit
//
//  Created by Jonathan García on 20/02/2024.
//

import Foundation

public enum SearchItemsEndpoint {
    case get
    
    public func url(baseURL: URL, query: String) -> URL {
        switch self {
        case .get:
            let url = baseURL.appendingPathComponent("/MLA/search")
            var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
            urlComponents?.queryItems = [URLQueryItem(name: "q", value: query)]
            return urlComponents?.url ?? url
        }
    }
}
