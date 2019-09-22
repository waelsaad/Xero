//
//  HourlyForecastCollectionViewCell.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import UIKit

final class HourlyForecastCollectionViewCell: UICollectionViewCell, Reusable {
    @IBOutlet private var HourlyWeatherView: UIView!
    @IBOutlet private var timeLabel: UILabel!
    @IBOutlet private var weatherImage: UIImageView!
    @IBOutlet private var temperature: UILabel!
}

extension HourlyForecastCollectionViewCell {
    func configureCell(cellDisplayModel: HourlyCellDisplayModel) {
        HourlyWeatherView.backgroundColor = .clear
        temperature.text = cellDisplayModel.temperature
        timeLabel.text = cellDisplayModel.time
        weatherImage.setImage(url: cellDisplayModel.imageURL)
    }
}
