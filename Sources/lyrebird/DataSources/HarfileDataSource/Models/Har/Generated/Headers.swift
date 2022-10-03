//
//  Headers.swift
//
//  Created by Piotr Olechnowicz on 18/05/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Headers: Codable {

  enum CodingKeys: String, CodingKey {
    case name
    case value
  }

  var name: String
  var value: String



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decode(String.self, forKey: .name)
    value = try container.decode(String.self, forKey: .value)
  }

}
