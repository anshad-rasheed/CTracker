//  CTracker
//
//  Created by Anshad R on 25/04/20.
//  Copyright © 2020 Anshad R. All rights reserved.
//

import Foundation
struct CovidDataModel: Codable, Identifiable {
    var id = UUID()
	let caseTimeDataModel: [CaseTimeDataModel]?
	let statewise: [Statewise]?
	let tested: [Tested]?

	enum CodingKeys: String, CodingKey {
		case caseTimeDataModel = "cases_time_series"
		case statewise = "statewise"
		case tested = "tested"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		caseTimeDataModel = try values.decodeIfPresent([CaseTimeDataModel].self, forKey: .caseTimeDataModel)
		statewise = try values.decodeIfPresent([Statewise].self, forKey: .statewise)
		tested = try values.decodeIfPresent([Tested].self, forKey: .tested)
	}

}
