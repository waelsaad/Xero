//
//  FavouriteCityUICollectionViewCell.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import UIKit

final class FavouriteCityUICollectionViewCell: UICollectionViewCell, Reusable {
    @IBOutlet private var timeLabel: UILabel!
    @IBOutlet private var weatherImage: UIImageView!
    @IBOutlet private var temperature: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
}

extension FavouriteCityUICollectionViewCell {
    func configureCell(cellDisplayModel: FavouriteCityModel) {
        descriptionLabel.text = cellDisplayModel.name
        temperature.text = cellDisplayModel.temperature
        timeLabel.text = cellDisplayModel.time
        weatherImage.setImage(url: cellDisplayModel.imageURL)
    }
}
