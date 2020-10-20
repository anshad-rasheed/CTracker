//  CTracker
//
//  Created by Anshad R on 25/04/20.
//  Copyright © 2020 Anshad R. All rights reserved.
//
import Foundation
struct CaseTimeDataModel: Codable, Identifiable {
    var id: Int?
	let dailyconfirmed: String?
	let dailydeceased: String?
	let dailyrecovered: String?
	let date: String?
	let totalconfirmed: String?
	let totaldeceased: String?
	let totalrecovered: String?

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		dailyconfirmed = try values.decodeIfPresent(String.self, forKey: .dailyconfirmed)
		dailydeceased = try values.decodeIfPresent(String.self, forKey: .dailydeceased)
		dailyrecovered = try values.decodeIfPresent(String.self, forKey: .dailyrecovered)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		totalconfirmed = try values.decodeIfPresent(String.self, forKey: .totalconfirmed)
		totaldeceased = try values.decodeIfPresent(String.self, forKey: .totaldeceased)
		totalrecovered = try values.decodeIfPresent(String.self, forKey: .totalrecovered)
	}

}

struct CaseTimeDataViewModel {
    private let caseTimeDataModel: CaseTimeDataModel
    init(caseTimeDataModel: CaseTimeDataModel) {
        self.caseTimeDataModel = caseTimeDataModel
    }
    
    var totalconfirmedFloatValue: Float {
        return  caseTimeDataModel.totalconfirmed?.floatValue() ?? 0
    }
}
