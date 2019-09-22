//
//  UIViewController+Additions.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import UIKit

extension UIViewController {
  
  var isViewVisible: Bool {
    return viewIfLoaded?.window != nil
  }
}
