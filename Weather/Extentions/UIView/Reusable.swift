//
//  Reusable.swift
//  Weather
//
//  Created by r00tdvd on 22/9/19 Copyright © 2019. All rights reserved.
//

protocol Reusable {

    static var reuseIdentifier: String { get }
}

extension Reusable {

    static var reuseIdentifier: String { return String(describing: self) }
}
