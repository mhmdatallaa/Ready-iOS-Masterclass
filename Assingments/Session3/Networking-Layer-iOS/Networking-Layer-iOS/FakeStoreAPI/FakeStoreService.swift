//
//  FakeStoreService.swift
//  Networking-Layer-iOS
//
//  Created by Mohamed Atallah on 07/12/2025.
//

import Foundation

protocol FakeStoreServicing {
    func fetchProducts() async throws -> [Product]
}

final class FakeStoreService: FakeStoreServicing {
    let client: HTTPClient
    init(client: HTTPClient) {
        self.client = client
    }
    func fetchProducts() async throws -> [Product] {
        let endPoint: EndPoint = FakeStoreEndPoint.fetchProducts
        let products: [Product] = try await client.request(endPoint)
        return products
    }
}
