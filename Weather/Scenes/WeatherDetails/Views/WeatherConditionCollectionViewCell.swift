//
//  WeatherConditionCollectionViewCell.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import Foundation
import UIKit

class WeatherConditionCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var descriptionKeyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
}

extension WeatherConditionCollectionViewCell {
    func configureCell(key: String, value: String) {
        valueLabel.text = value
        descriptionKeyLabel.text = key
    }
}
