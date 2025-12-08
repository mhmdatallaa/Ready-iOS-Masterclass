//
//  URLSessionNetworkClient.swift
//  Networking-Layer-iOS
//
//  Created by Mohamed Atallah on 07/12/2025.
//

import Foundation

final class URLSessionNetworkClient: HTTPClient {
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Decodable>(_ endPoint: EndPoint) async throws -> T {
        let urlRequest = try RequestBuilder(endPoint: endPoint, timeoutInterval: 30).build()
        
        do {
            let (data, response) = try await session.data(for: urlRequest)
            
            try handleURLResponse(response)
            
            return try decode(T.self, from: data)
            
        } catch is CancellationError {
            throw NetworkError.cancelled
        } catch {
            throw NetworkError.transportError(error)
        }
    }
    
    private func handleURLResponse( _ response: URLResponse) throws {
        if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
            throw NetworkError.serverError(statusCode: response.statusCode)
        }
    }
    
    private func decode<T: Decodable>(_: T.Type, from data: Data) throws -> T {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
    
}

