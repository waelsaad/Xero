//
//  Weather.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import Foundation

struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

extension Weather {
    var imageUrl: String {
        return EndPoint.icon(id: icon).endpointUrl(with: nil)?.absoluteString ?? String.empty
    }
}

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: false)
        components?.queryItems = queries.map {
            URLQueryItem(name: $0.0, value: $0.1)
        }
        
        return components?.url
    }
}

struct WeatherDetails: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Double?
    let wind: Wind
    let snow: Snow?
    let rain: Rain?
    let clouds: Clouds?
    let dt: Int
    let sys: CurrentSys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}

extension WeatherDetails {
    var time: String {
        return Date(timeIntervalSince1970: Double(dt)).formatDate(format: "hh:mm a")
    }
}

struct CurrentSys: Codable {
    let country: String?
    let id: Int?
    let message: Double
    let type: Int?
    let sunrise: Double
    let sunset: Double
}



