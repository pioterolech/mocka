//
//  HarFile.swift
//
//  Created by Piotr Olechnowicz on 18/05/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct HarFile: Codable {

  enum CodingKeys: String, CodingKey {
    case log
  }

  var log: Log



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    log = try container.decode(Log.self, forKey: .log)
  }
}
