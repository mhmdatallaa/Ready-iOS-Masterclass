//
//  FakeStoreService.swift
//  Networking-Layer-iOS
//
//  Created by Mohamed Atallah on 07/12/2025.
//

import Foundation

enum FakeStoreConstants {
    static let baseURL = "https://fakestoreapi.com"
    static let productsPath = "/products"
}

enum FakeStoreEndPoint: EndPoint {
    case fetchProducts
    
    var baseURL: String {
        switch self {
        case .fetchProducts: FakeStoreConstants.baseURL
        }
    }
    var path: String {
        switch self {
        case .fetchProducts: FakeStoreConstants.productsPath
        }
    }
}

