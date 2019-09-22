//
//  APIEndpoints.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import Foundation

// MARK: - Protocol to provide string by concatinating base URL
public protocol EndpointsConfiguration {
    func absoluteURL() -> String
}

enum EndPoint {
    
    case weather
    case forecast
    case icon(id: String)
    
    func endpointUrl(with items: [URLQueryItem]?) -> URL? {
        var components = URLComponents()
        var items = items
        components.scheme = Constants.kScheme
        components.host = Constants.kApiBaseURL
        components.path = "\(Constants.kApiVersion)"
        switch self {
           
        case .weather:
            items?.append(URLQueryItem(name: Constants.kAppID, value: Constants.kApiKey))
            items?.append(URLQueryItem(name: Constants.kUnits, value: Constants.kApiUnits))
            components.path += "\(Path.weather.rawValue)"
            
        case .forecast:
            items?.append(URLQueryItem(name: Constants.kAppID, value: Constants.kApiKey))
            items?.append(URLQueryItem(name: Constants.kUnits, value: Constants.kApiUnits))
            components.path += "\(Path.forecast.rawValue)"
            
        case .icon(id: let id):
            components.path = "\(Path.icon.rawValue)/\(id)\(Constants.kIconExtension)"
        }
        
        components.queryItems = items
        return components.url
    }
}

extension EndPoint {
    
    enum Constants {
        static let kAppID = "APPID"
        static let kUnits = "units"
        static let kScheme = "https"
        static let kApiBaseURL = "api.openweathermap.org"
        static let kApiVersion = "/data/2.5/"
        static let kApiUnits: String = Unit.celcius.rawValue
        static let kApiKey = "c89391d142b073bdda9e12547ea48a25"
        static let kIconExtension = ".png"
    }
    
    enum Unit: String {
        case fahrenheit = "imperial"
        case celcius = "metric"
    }
    
    private enum Path: String {
        case weather
        case forecast
        case icon = "/img/w"
    }
}
