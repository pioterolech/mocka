//
//  Creator.swift
//
//  Created by Piotr Olechnowicz on 18/05/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Creator: Codable {

  enum CodingKeys: String, CodingKey {
    case name
    case version
  }

  var name: String
  var version: String



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decode(String.self, forKey: .name)
    version = try container.decode(String.self, forKey: .version)
  }

}
