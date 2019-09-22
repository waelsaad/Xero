//
//  Detail.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import Foundation

struct Sys: Codable {
    let pod: String?
}

struct Detail: Codable {
    let dt: Int
    let main: Main
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let rain: Rain?
    let snow: Snow?
    let sys: Sys
    let dt_txt: String
}

extension Detail {
    var time: String {
        return Date(timeIntervalSince1970: Double(dt)).formatDate(format: "h a")
    }
}
