//
//  ForeCastWeather.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import Foundation

struct ForeCastWeather: Codable {
    let cod: String
    let message: Double
    let cnt: Int
    let list: [Detail]
    let city: City
}
