//
//  FavouriteCitiesViewController.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import UIKit
import CoreLocation

final class FavouriteCitiesViewController: UIViewController {

    @IBOutlet private var collectionView: UICollectionView!
    
    private var viewModel: FavouriteCitiesViewModel! = FavouriteCitiesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        getLocation()
        configureNavigationBar()
        
        viewModel.fetchWeatherForCities(completion: { result in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }

    private func configureNavigationBar() {
        guard let navigationBar = navigationController?.navigationBar else { return }
        Theme.applyAppearance(for: navigationBar, theme: .weather)
        navigationBar.topItem?.title = viewModel.navigationBarTitle
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .lightblue
        collectionView.register(forClass: FavouriteCityUICollectionViewCell.self)
    }
    
    func setupNavigationBarTitle(_ title: String) {
        self.title = title
    }
    
    func getLocation() {
        LocationManager.shared.delegate = self
        LocationManager.shared.getLocation()
    }
}

extension FavouriteCitiesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.setSelectedCity(withIndex: indexPath.row)
        viewModel.presentWeatherDetailsScreen(hostViewController: self)
    }
}

extension FavouriteCitiesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let cell: WeatherTableViewCell = collectionView.dequeueReusableCell(for: indexPath)
        let cell: FavouriteCityUICollectionViewCell = collectionView.dequeueReusableCell(forClass: FavouriteCityUICollectionViewCell.self, indexPath: indexPath)
        cell.configureCell(cellDisplayModel: viewModel.data[indexPath.row])
        return cell
    }
}

extension FavouriteCitiesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: UIScreen.main.bounds.width, height: Constants.cellHeight)
    }
}


extension FavouriteCitiesViewController: LocationManagerDelegate {
    func locationDidUpdate(location: CLLocation) {
        let lat = location.coordinate.latitude
        let lon = location.coordinate.longitude
        viewModel.fetchWeatherForCurrentCity(lon: lon, lat: lat, completion: { result in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
    }
}

extension FavouriteCitiesViewController {
    struct Constants {
        static let refreshDuration = 60.0
        static let cellHeight: CGFloat = 91.0
    }
}
