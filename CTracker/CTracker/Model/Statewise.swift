//  CTracker
//
//  Created by Anshad R on 25/04/20.
//  Copyright © 2020 Anshad R. All rights reserved.
//
import Foundation
struct Statewise: Codable, Identifiable {
    var id = UUID()
	let active: String?
	let confirmed: String?
	let deaths: String?
	let deltaconfirmed: String?
	let deltadeaths: String?
	let deltarecovered: String?
	let lastupdatedtime: String?
	let recovered: String?
	let state: String?
	let statecode: String?
	let statenotes: String?

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		active = try values.decodeIfPresent(String.self, forKey: .active)
		confirmed = try values.decodeIfPresent(String.self, forKey: .confirmed)
		deaths = try values.decodeIfPresent(String.self, forKey: .deaths)
		deltaconfirmed = try values.decodeIfPresent(String.self, forKey: .deltaconfirmed)
		deltadeaths = try values.decodeIfPresent(String.self, forKey: .deltadeaths)
		deltarecovered = try values.decodeIfPresent(String.self, forKey: .deltarecovered)
		lastupdatedtime = try values.decodeIfPresent(String.self, forKey: .lastupdatedtime)
		recovered = try values.decodeIfPresent(String.self, forKey: .recovered)
		state = try values.decodeIfPresent(String.self, forKey: .state)
		statecode = try values.decodeIfPresent(String.self, forKey: .statecode)
		statenotes = try values.decodeIfPresent(String.self, forKey: .statenotes)
	}

}
