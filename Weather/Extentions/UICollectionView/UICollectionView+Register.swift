//
//  UICollectionView+Register.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {

  func register(forClass aClass: AnyClass) {
    let className = String(describing: aClass)
    register(UINib(nibName: className, bundle: Bundle.main), forCellWithReuseIdentifier: className)
  }
  
  func dequeueReusableCell<T: UICollectionViewCell>(forClass aClass: AnyClass, indexPath: IndexPath) -> T {
    let className = String(describing: aClass)
    
    guard let cell = dequeueReusableCell(withReuseIdentifier: className, for: indexPath) as? T else {
      fatalError("Cannot dequeue cell for class \(aClass)")
    }
    
    return cell
  }
}
