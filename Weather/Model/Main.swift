//
//  Main.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import Foundation

struct Main: Codable {
    let temp: Double
    let pressure: Double
    let humidity: Double
    let temp_min: Double
    let temp_max: Double
    let temp_kf: Double?
    let sea_level: Double?
    let grnd_level: Double?
}

extension Main {
    var minTemp: String {
        return temp_min.description
        //return temp_min.convertToCelsius()
    }
    
    var maxTemp: String {
        return temp_max.description
        //return temp_max.convertToCelsius()
    }
    
    var temperature: String {
        return Int(temp).description + " º"
        
        // I initially implemented this when I didn't see the units key
        //return temp.convertToCelsius()
    }
}
