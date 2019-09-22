//
//  WeatherDetailsViewController.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import UIKit
import CoreLocation

final class WeatherDetailsViewController: UIViewController {

    @IBOutlet private var cityNameLabel: UILabel! {
        didSet {
            cityNameLabel.text = viewModel.cityName
        }
    }
    
    @IBOutlet private var tempMaxLabel: UILabel! {
        didSet {
            tempMaxLabel.text = viewModel.maxTemp
        }
    }
    
    @IBOutlet private var tempMinLabel: UILabel! {
        didSet {
            tempMinLabel.text = viewModel.minTemp
        }
    }
    
    @IBOutlet private var weatherStatusLabel: UILabel! {
        didSet {
            weatherStatusLabel.text = viewModel.weatherCondition
        }
    }
    
    @IBOutlet private var dateLabel: UILabel! {
        didSet {
            dateLabel.text = viewModel.day
        }
    }
    
    @IBOutlet private var temperatureLabel: UILabel! {
        didSet {
            temperatureLabel.text = viewModel.temperature
        }
    }
    
    @IBOutlet private var hourlyWeatherCollectionView: UICollectionView! {
        didSet {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.itemSize = CGSize(width: Constants.hourlyCellWidth, height: Constants.hourlyCellHeight)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumInteritemSpacing = 0.0
            hourlyWeatherCollectionView.collectionViewLayout = flowLayout
        }
    }
    
    @IBOutlet private var weatherConditionsCollectionView: UICollectionView! {
        didSet {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.itemSize = CGSize(width: Constants.weatherConditionCellWidth, height: Constants.weatherConditionCellHeight)
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumInteritemSpacing = 0.0
            weatherConditionsCollectionView.collectionViewLayout = flowLayout
        }
    }
    
    var viewModel: WeatherDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        configureNavigationBar()
        self.view.backgroundColor = .lightblue
        getData()
    }

    private func configureNavigationBar() {
        guard let navigationBar = navigationController?.navigationBar else { return }
        Theme.applyAppearance(for: navigationBar, theme: .weather)
        navigationBar.topItem?.title = viewModel.navigationBarTitle
    }
    
    private func setupCollectionView() {
        hourlyWeatherCollectionView.delegate = self
        hourlyWeatherCollectionView.dataSource = self
        
        weatherConditionsCollectionView.delegate = self
        weatherConditionsCollectionView.dataSource = self
        
        hourlyWeatherCollectionView.backgroundColor = .lightblue
        weatherConditionsCollectionView.backgroundColor = .lightblue
        
        hourlyWeatherCollectionView.register(forClass: HourlyForecastCollectionViewCell.self)
        weatherConditionsCollectionView.register(forClass: WeatherConditionCollectionViewCell.self)
    }
    
    private func getData() {
        viewModel.fetchWeatherForecast(city: viewModel.cityName, completion: { result in
            DispatchQueue.main.async {
                self.hourlyWeatherCollectionView.reloadData()
            }
        })
    }
}

extension WeatherDetailsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Not Required.
    }
}

extension WeatherDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == hourlyWeatherCollectionView ? viewModel.weatherInDay.count : viewModel.keys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == hourlyWeatherCollectionView {
            let cell: HourlyForecastCollectionViewCell = collectionView.dequeueReusableCell(forClass: HourlyForecastCollectionViewCell.self, indexPath: indexPath)
            cell.configureCell(cellDisplayModel: viewModel.getWeatherForHourByIndex(index: indexPath.row))
            return cell
        } else  {
            let cell: WeatherConditionCollectionViewCell = collectionView.dequeueReusableCell(forClass: WeatherConditionCollectionViewCell.self, indexPath: indexPath)
            cell.configureCell(key: viewModel.keys[indexPath.row], value: viewModel.values[indexPath.row])
            return cell
        }
    }
}

extension WeatherDetailsViewController: UICollectionViewDelegateFlowLayout {

}

extension WeatherDetailsViewController {
    struct Constants {
        static let hourlyCellWidth: CGFloat = 75
        static let hourlyCellHeight: CGFloat = 100
        
        static let weatherConditionCellWidth: CGFloat = 130
        static let weatherConditionCellHeight: CGFloat = 100
    }
}
