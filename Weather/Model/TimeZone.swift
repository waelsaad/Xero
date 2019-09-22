//
//  TimeZone.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import Foundation
struct TimeZone: Codable {
    let countryCode: String
    let countryName: String
    // let dstOffset: Int
    // let gmtOffset: Int
    let lat: Double
    let lng: Double
    // let rawOffset: Int
    // let sunrise: String
    // let sunset: String
    let time: String
    let timezoneId: String
}
