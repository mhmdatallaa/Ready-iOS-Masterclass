//
//  HTTPClient.swift
//  Networking-Layer-iOS
//
//  Created by Mohamed Atallah on 07/12/2025.
//

import Foundation

protocol HTTPClient {
    func request<T: Decodable>(_ endPoint: EndPoint) async throws -> T
}
