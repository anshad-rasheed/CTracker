//  CTracker
//
//  Created by Anshad R on 25/04/20.
//  Copyright © 2020 Anshad R. All rights reserved.
//

import Foundation
struct Tested: Codable, Identifiable {
    var id: Int?
	let individualstestedperconfirmedcase: String?
	let positivecasesfromsamplesreported: String?
	let samplereportedtoday: String?
	let source: String?
	let testpositivityrate: String?
	let testsconductedbyprivatelabs: String?
	let testsperconfirmedcase: String?
	let totalindividualstested: String?
	let totalpositivecases: String?
	let totalsamplestested: String?
	let updatetimestamp: String?
    
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		individualstestedperconfirmedcase = try values.decodeIfPresent(String.self,
                                                                       forKey: .individualstestedperconfirmedcase)
		positivecasesfromsamplesreported = try values.decodeIfPresent(String.self, forKey: .positivecasesfromsamplesreported)
		samplereportedtoday = try values.decodeIfPresent(String.self, forKey: .samplereportedtoday)
		source = try values.decodeIfPresent(String.self, forKey: .source)
		testpositivityrate = try values.decodeIfPresent(String.self, forKey: .testpositivityrate)
		testsconductedbyprivatelabs = try values.decodeIfPresent(String.self, forKey: .testsconductedbyprivatelabs)
		testsperconfirmedcase = try values.decodeIfPresent(String.self, forKey: .testsperconfirmedcase)
		totalindividualstested = try values.decodeIfPresent(String.self, forKey: .totalindividualstested)
		totalpositivecases = try values.decodeIfPresent(String.self, forKey: .totalpositivecases)
		totalsamplestested = try values.decodeIfPresent(String.self, forKey: .totalsamplestested)
		updatetimestamp = try values.decodeIfPresent(String.self, forKey: .updatetimestamp)
	}

}
