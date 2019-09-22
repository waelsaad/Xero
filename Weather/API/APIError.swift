//
//  APIError.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import Foundation

enum APIError: Error, Equatable {
    case apiError(String)
    case invalidEndpoint
    case invalidResponse
    case noData
    case decodeError
}

// TODO: The error descriptions could be localized
extension APIError: CustomStringConvertible {
    var description: String {
        switch self {
        case .apiError:
            return "Could not reach API successfully"
        case .invalidEndpoint:
            return "Could not build propper URL"
        case .invalidResponse:
            return "Could not get propper response"
        case .noData:
            return "Could not find data"
        case .decodeError:
            return "Could not decode data"
        }
    }
}
