//
//  Theme+Main.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import UIKit.UIColor
import UIKit.UIFont

extension Theme.Color {

  static let defaultNavigationBackground: UIColor = .clear

  static let navigationBackground: UIColor = .lightblue

  static let navigationBarTint: UIColor = .white

  static let detailNavigationBackground: UIColor = .white

  static let detailNavigationBarTint: UIColor = .lightblue
}

extension Theme.Font {
    static let navigationBarTitle: UIFont = UIFont(name: "MissionGothic-Regular", size: 15)!
}

extension Theme.StringAttributes {

  static var navigationTitle: [NSAttributedString.Key: Any] {
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = 0.7
    paragraphStyle.alignment = .center

    return [
      .font: UIFont(name: "MissionGothic-Regular", size: 15)!,
      .kern: 1.5,
      .paragraphStyle: paragraphStyle
    ]
  }
}

extension Theme {
    static func applyAppearance(for navigationBar: UINavigationBar, theme: NavigationBarTheme) {
        switch theme {
        case .weather:
            navigationBar.tintColor = .white
            navigationBar.barTintColor = .lightblue
            navigationBar.titleTextAttributes = [/*.font: Theme.Font.navigationBarTitle,*/
                                                 .foregroundColor: UIColor.white,
                                                 .kern: 1.5] as [NSAttributedString.Key: Any]
        }
    }
    

}
enum NavigationBarTheme {
    case weather
}
