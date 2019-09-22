//
//  HourlyCellDisplayModel.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import Foundation

struct HourlyCellDisplayModel {
    var weatherDetails: Detail
}

extension HourlyCellDisplayModel {
    var imageURL: URL? {
        return URL(string: weatherDetails.weather.first?.imageUrl ?? String.empty)
    }
    
    var temperature: String {
        return weatherDetails.main.temperature
        
    }

    var time: String {
        return weatherDetails.time
    }
}
