//
//  SceneDelegate.swift
//  List
//
//  Created by Anshad R on 18/04/20.
//  Copyright © 2020 Anshad R. All rights reserved.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

