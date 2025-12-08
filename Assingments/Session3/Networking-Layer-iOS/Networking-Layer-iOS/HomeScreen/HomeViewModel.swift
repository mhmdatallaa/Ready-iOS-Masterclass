//
//  HomeViewModel.swift
//  Networking-Layer-iOS
//
//  Created by Mohamed Atallah on 08/12/2025.
//

import Foundation

protocol HomeViewModelProtocol {
    var products: [Product] { get }
    func getAllProducts() async
}

class HomeViewModel: HomeViewModelProtocol {
    let serivce: FakeStoreServicing
    var products: [Product] = []
        
    init(serivce: FakeStoreServicing) {
        self.serivce = serivce
    }
    
    func getAllProducts() async {
        do {
            products = try await serivce.fetchProducts()
        } catch {
            print(error)
        }
        
    }
}
