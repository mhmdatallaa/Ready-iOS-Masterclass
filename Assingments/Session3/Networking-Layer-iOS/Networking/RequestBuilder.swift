//
//  RequestBuilder.swift
//  Networking-Layer-iOS
//
//  Created by Mohamed Atallah on 07/12/2025.
//

import Foundation

struct RequestBuilder {
    let endPoint: EndPoint
    let timeoutInterval: TimeInterval
    
    func build() throws -> URLRequest {
        var request = URLRequest(url: try endPoint.buildURL())
        request.httpMethod = endPoint.method.rawValue
        request.allHTTPHeaderFields = endPoint.headers
        request.timeoutInterval = timeoutInterval
        if let body = endPoint.body {
            let encoder = JSONEncoder()
            request.httpBody = try encoder.encode(body)
        }
        return request
    }
}
