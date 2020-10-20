//
//  DistrictDataModel.swift
//  CTracker
//
//  Created by Anshad R on 03/05/20.
//  Copyright © 2020 Anshad R. All rights reserved.
//

import Foundation
import Foundation
struct District: Codable, Identifiable {
    var id = UUID()
    let notes : String?
    let active : Int?
    let confirmed : Int?
    let deceased : Int?
    let recovered : Int?

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        notes = try values.decodeIfPresent(String.self, forKey: .notes)
        active = try values.decodeIfPresent(Int.self, forKey: .active)
        confirmed = try values.decodeIfPresent(Int.self, forKey: .confirmed)
        deceased = try values.decodeIfPresent(Int.self, forKey: .deceased)
        recovered = try values.decodeIfPresent(Int.self, forKey: .recovered)
    }
}

struct DistrictData: Codable, Identifiable {
    var id = UUID()
    let districtData: [District]?
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        districtData = try values.decodeIfPresent([District].self, forKey: .districtData)
    }
}

