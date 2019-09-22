//
//  WeatherDetailsViewModel.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherDetailsViewModelType {

    var navigationBarTitle: String { get }

    func fetchWeatherForecast(city: String, completion: @escaping (Result<ForeCastWeather, APIError>) -> Void)
}

class WeatherDetailsViewModel: WeatherDetailsViewModelType {
    
    var weatherInDay: [Detail] = []

    var selectedFavouriteCity: FavouriteCityModel
    
    var navigationBarTitle: String {
        return "FAVOURITE.WEATHER.NAVIGATION.TITLE".localized
    }

    var values: [String]
    var keys = ["Sunrise", "Sunset", "Rain", "Humidity", "Wind", "Visibility", "Pressure", "Clouds"]
    
    init(favouriteCityModel: FavouriteCityModel) {
        selectedFavouriteCity = favouriteCityModel
        let weatherDetails = selectedFavouriteCity.weatherDetails
        let sunrise = weatherDetails.sys.sunrise.getDateFromUnixStamp()
        let sunset = weatherDetails.sys.sunset.getDateFromUnixStamp()
        let rain = weatherDetails.rain?.one?.description ?? 0.description
        let humidity = weatherDetails.main.humidity.description + " %"
        let wind = "\(weatherDetails.wind.speed) km/h"
        let visibility = "\((weatherDetails.visibility ?? 1000/1000).toFixed(0)) km"
        let pressure = "\(weatherDetails.main.pressure) hPa"
        let clouds = "\(weatherDetails.clouds?.all ?? 0) %"
        values = [sunrise, sunset, rain, humidity, wind, visibility, pressure, clouds]
    }
    
    var cityName: String {
        return selectedFavouriteCity.weatherDetails.name
    }
    
    var maxTemp: String {
        return selectedFavouriteCity.weatherDetails.main.maxTemp
    }
    
    var minTemp: String {
        return selectedFavouriteCity.weatherDetails.main.minTemp
    }
    
    var weatherCondition: String {
        return selectedFavouriteCity.weatherDetails.weather.first?.description ?? String.empty
    }
    
    var day: String {
        return Date().getDayOfWeek() + "WEATHER.DETAILS.DATE.TODAY".localized
    }
    
    var temperature: String {
        return selectedFavouriteCity.weatherDetails.main.temperature
    }
    
    func getWeatherConditionByIndex(index: Int) -> HourlyCellDisplayModel {
        return HourlyCellDisplayModel(weatherDetails: weatherInDay[index])
    }
    
    func getWeatherForHourByIndex(index: Int) -> HourlyCellDisplayModel {
        return HourlyCellDisplayModel(weatherDetails: weatherInDay[index])
    }
    
    func fetchWeatherForecast(city: String, completion: @escaping (Result<ForeCastWeather, APIError>) -> Void) {
        APIWeather.shared.fetchWeatherForecast(city: city, completion: { (result: Result<ForeCastWeather, APIError>) in
            switch result {
            case let .success(data):
                self.handleSuccess(data: data)
                completion(.success(data))
            case let .failure (error):
                print(error)
                completion(.failure(error))
            }
        })
    }
    
    func handleSuccess(data: ForeCastWeather) {
        weatherInDay = Array(data.list.prefix(Constants.maxNumberOfHoursToDisplay))
    }
}


extension WeatherDetailsViewModel {
    private enum Constants {
        static let maxNumberOfHoursToDisplay = 10
    }
}
