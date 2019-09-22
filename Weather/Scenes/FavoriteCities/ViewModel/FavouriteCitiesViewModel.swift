//
//  FavouriteCitiesViewModel.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import Foundation
import CoreLocation

protocol FavouriteCitiesViewModelType {

    var navigationBarTitle: String { get }
    
    func presentWeatherDetailsScreen(hostViewController: FavouriteCitiesViewController)
    
    func fetchWeatherForCities(completion: @escaping (Result<WeatherDetails, APIError>) -> Void)
    func fetchWeatherForCurrentCity(lon: Double, lat: Double, completion: @escaping (Result<WeatherDetails, APIError>) -> Void)
}

class FavouriteCitiesViewModel: FavouriteCitiesViewModelType {
    
    var selectedCity: FavouriteCityModel!
    
    var data: [FavouriteCityModel] = []

    var navigationBarTitle: String {
        return "FAVOURITE.WEATHER.NAVIGATION.TITLE".localized
    }

    func  setSelectedCity(withIndex: Int) {
        selectedCity = data[withIndex]
    }
    
    func  getCurrentWeatherCity() -> FavouriteCityModel? {
        return selectedCity
    }
    
    func presentWeatherDetailsScreen(hostViewController: FavouriteCitiesViewController) {
        let viewController: WeatherDetailsViewController = .viewController(fromStoryboard: .WeatherDetails)
        viewController.viewModel = WeatherDetailsViewModel(favouriteCityModel: selectedCity)
        hostViewController.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func fetchWeatherForCurrentCity(lon: Double, lat: Double, completion: @escaping (Result<WeatherDetails, APIError>) -> Void) {
        APIWeather.shared.fetchWeatherByLocation(lon: lon, lat: lat, completion: { (result: Result<WeatherDetails, APIError>) in
            switch result {
            case let .success(data):
                self.handleSuccess(data: data, isCurrentLocation: true)
                completion(.success(data))
            case let .failure (error):
                completion(.failure(error))
            }
        })
    }
    
    func fetchWeatherForCity(city: String, completion: @escaping (Result<WeatherDetails, APIError>) -> Void) {
        APIWeather.shared.fetchWeatherByCityName(city: city, completion: { (result: Result<WeatherDetails, APIError>) in
            switch result {
            case let .success(data):
                self.handleSuccess(data: data)
                completion(.success(data))
            case let .failure (error):
                completion(.failure(error))
            }
        })
    }
    
    func handleSuccess(data: WeatherDetails, isCurrentLocation: Bool = false) {
        let cellData = FavouriteCityModel(isCurrentLocation: isCurrentLocation, weatherDetails: data)
        //print(self.data.count)
        isCurrentLocation ? self.data.insert(cellData, at: 0) : self.data.append(cellData)
    }
    
    func fetchWeatherForCities(completion: @escaping (Result<WeatherDetails, APIError>) -> Void) {
        for city in Constants.cities {
            fetchWeatherForCity(city: city, completion: { result in })
        }
    }
}


extension FavouriteCitiesViewModel {
    private enum Constants {
        static let cities = ["Sydney, AU",
                             "Gold Coast, AU",
                             "Canberra, AU",
                             "Melbourne, AU",
                             "London, UK",
                             "New York, US"]
    }
}
