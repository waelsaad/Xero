//
//  ViewController+NavigationBar.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import UIKit

extension UIViewController {

  func configureNavigationBar(with title: String?, theme: NavigationBarTheme, applyStatusBar: Bool = true) {

    if let title = title {
      navigationItem.title = title
    }
    navigationController?.navigationBar.barTintColor = .lightblue

    guard let navigationBar = navigationController?.navigationBar else { return }
    Theme.applyAppearance(for: navigationBar, theme: theme)
  }
}
