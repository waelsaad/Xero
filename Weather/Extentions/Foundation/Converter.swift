//
//  Converter.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import Foundation

extension Double {
    func toFixed(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier)/multiplier
    }
    
    var toUTCDate: Date {
        return Date(timeIntervalSince1970: self)
    }
    
    func convertToCelsius() -> String {
        let temperatureKelvin = Measurement(value: self, unit: UnitTemperature.kelvin)
        let temperature: Double = temperatureKelvin.converted(to: UnitTemperature.celsius).value
        return String(format: "%.1f", temperature) + " º"
    }
}

class Converter {
    func convertKToC(kevin: Double) -> Int {
        let celsius = kevin - 273.15
        return Int(celsius)
    }
}
