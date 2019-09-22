//
//  City.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import Foundation

struct City: Codable {
    let id: Int
    let name: String
    let country: String?
    let coord: Coord
    let population: Int?
}
