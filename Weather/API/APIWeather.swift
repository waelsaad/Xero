//
//  APIWeather.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import Foundation

final class APIWeather {
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        //jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }()
    
    static let shared: APIWeather = APIWeather()
    
    func fetchResources<T: Decodable>(url: URL?, completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        URLSession.shared.dataTask(with: url) { result in
            switch result {
            case .success(let (response, data)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidResponse))
                    return
                }
                do {
                    //print(String.init(bytes: data, encoding: .utf8)!)
                    let values = try self.jsonDecoder.decode(T.self, from: data)
                    completion(.success(values))
                } catch (let error) {
                    print(error)
                    completion(.failure(.decodeError))
                }
            case .failure(let error):
                completion(.failure(.apiError(error.localizedDescription)))
            }
        }.resume()
    }

    func fetchWeatherByLocation(lon: Double,
                                    lat: Double,
                                    completion: @escaping (Result<WeatherDetails, APIError>) -> Void) {
        let queryItems = [
            URLQueryItem(name: "lon", value: lon.description),
            URLQueryItem(name: "lat", value: lat.description)
        ]

        guard
            let stringURL = EndPoint.weather.endpointUrl(with: queryItems)?.absoluteString,
            let url = URL(string: stringURL) else {
                return
        }
        
        fetchResources(url: url, completion: { (result: Result<WeatherDetails, APIError>) in
            completion(result)
        })
    }
    
    func fetchWeatherByCityName(city: String,
                             completion: @escaping (Result<WeatherDetails, APIError>) -> Void) {
        let queryItems = [URLQueryItem(name: "q", value: city)]
        guard
            let stringURL = EndPoint.weather.endpointUrl(with: queryItems)?.absoluteString,
            let url = URL(string: stringURL) else {
                return
        }
        
        fetchResources(url: url, completion: { (result: Result<WeatherDetails, APIError>) in
            completion(result)
        })
    }
    
    func fetchWeatherForecast(city: String,
                              completion: @escaping (Result<ForeCastWeather, APIError>) -> Void) {
        let queryItems = [URLQueryItem(name: "q", value: city)]
        guard
            let stringURL = EndPoint.forecast.endpointUrl(with: queryItems)?.absoluteString,
            let url = URL(string: stringURL) else {
                return
        }
        
        fetchResources(url: url, completion: { (result: Result<ForeCastWeather, APIError>) in
            completion(result)
        })
    }
}
