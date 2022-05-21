//
//  Log.swift
//
//  Created by Piotr Olechnowicz on 18/05/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Log: Codable {

  enum CodingKeys: String, CodingKey {
    case entries
    case version
    case creator
  }

  var entries: [Entries]
  var version: String
  var creator: Creator



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    entries = try container.decode([Entries].self, forKey: .entries)
    version = try container.decode(String.self, forKey: .version)
    creator = try container.decode(Creator.self, forKey: .creator)
  }

}
