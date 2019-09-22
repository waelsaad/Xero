//
//  FavouriteCityModel.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import Foundation

struct FavouriteCityModel {
    var isCurrentLocation: Bool
    var weatherDetails: WeatherDetails
}

// I thinks this idea is pretty cool :)
extension FavouriteCityModel {
    var imageURL: URL? {
        return URL(string: weatherDetails.weather.first?.imageUrl ?? String.empty)
    }
    
    var name: String {
        return isCurrentLocation ? Constants.currentLocation : weatherDetails.name
    }
    
    var temperature: String {
        return weatherDetails.main.temperature
    }
    
    var time: String {
        return weatherDetails.time
    }
}

extension FavouriteCityModel {
    private enum Constants {
        static let currentLocation = "FAVOURITE.WEATHER.CURRENT.LOCATION".localized
    }
}
