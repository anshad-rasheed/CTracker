//
//  SceneDelegate.swift
//  List
//
//  Created by Anshad R on 18/04/20.
//  Copyright © 2020 Anshad R. All rights reserved.
//

import Foundation


enum NetworkEnvironment {
    case qa
    case production
    case staging
}

public enum CovidAPI {
    case stateWise
    case all
}

extension CovidAPI: EndPointType {
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://api.covid19india.org/"
        case .qa: return "https://api.covid19india.org/"
        case .staging: return "https://api.covid19india.org/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .stateWise:
            return "state_district_wise.json"
        case .all:
            return "data.json"
        
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        return.request
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}


