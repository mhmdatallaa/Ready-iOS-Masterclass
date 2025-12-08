//
//  EndPoint.swift
//  Networking-Layer-iOS
//
//  Created by Mohamed Atallah on 07/12/2025.
//

import Foundation

protocol EndPoint {    
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: String]? { get }
    var body: Encodable? { get }
    
    func buildURL() throws -> URL
}

extension EndPoint {
    var method: HTTPMethod { .GET }
    var scheme: HTTPScheme { .https }
    var parameters: [String: String]? { nil }
    var headers: [String: String]? { nil }
    var body: Encodable? { nil }

    func buildURL() throws -> URL {
        guard var components = URLComponents(string: baseURL) else {
                    throw NetworkError.invalidURL
                }
        components.path = path
        components.scheme = scheme.rawValue
        if let parameters {
            var queryItems = Array<URLQueryItem>()
            for parameter in parameters {
                let queryItem = URLQueryItem(name: parameter.key, value: parameter.value)
                queryItems.append(queryItem)
            }
            components.queryItems = queryItems
        }
        guard let url = components.url else { throw NetworkError.invalidURL }
        return url
    }
}

