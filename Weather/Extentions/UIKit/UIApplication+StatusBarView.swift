//
//  UIApplication+StatusBarView.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import UIKit

extension UIApplication {

  var statusBarView: UIView? {
    return value(forKey: KeysConstants.statusBar) as? UIView
  }

  enum KeysConstants {
    static let statusBar: String = "statusBar"
  }
}
