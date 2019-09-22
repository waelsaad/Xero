//
//  UIViewController+Storyboard.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

import UIKit

extension UIViewController {
    class func viewController<T>(fromStoryboard storyboard: Storyboard,
                                 bundle: Bundle? = nil) -> T where T: UIViewController {
        let storyboard = UIStoryboard(storyboard: storyboard, bundle: bundle)

        guard let viewController = storyboard.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }

        return viewController
    }
}
