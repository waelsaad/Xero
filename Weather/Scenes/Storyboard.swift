//
//  Storyboard.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

enum Storyboard: String {
  case FavouriteCities
  case WeatherDetails
}

extension Storyboard {
  var filename: String {
    let name = rawValue
    guard let first = name.first else { return "" }
    return String(first).uppercased() + name.dropFirst()
  }
}
