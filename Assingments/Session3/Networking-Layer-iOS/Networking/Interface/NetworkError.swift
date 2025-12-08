//
//  NetworkError.swift
//  Networking-Layer-iOS
//
//  Created by Mohamed Atallah on 07/12/2025.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case transportError(Error)
    case serverError(statusCode: Int)
    case decodingError(Error)
    case encodingError(Error)
    case cancelled
    case unknown
}

extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL provided was invalid."
        case .transportError(let error):
            return "A network transport error occurred: \(error.localizedDescription)."
        case .serverError(let status):
            return "Server returned an error with status code \(status)."
        case .decodingError(let error):
            return "Failed to decode the response: \(error.localizedDescription)."
        case .encodingError(let error):
            return "Failed to encode the request body: \(error.localizedDescription)."
        case .cancelled:
            return "The request was cancelled."
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
