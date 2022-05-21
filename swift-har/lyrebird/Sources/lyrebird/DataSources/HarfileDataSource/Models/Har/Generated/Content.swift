//
//  Content.swift
//
//  Created by Piotr Olechnowicz on 18/05/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Content: Codable {

  enum CodingKeys: String, CodingKey {
    case mimeType
    case size
    case encoding
    case text
  }

  var mimeType: String
  var size: Int
  var encoding: String
  var text: String



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    mimeType = try container.decode(String.self, forKey: .mimeType)
    size = try container.decode(Int.self, forKey: .size)
    encoding = try container.decode(String.self, forKey: .encoding)
    text = try container.decode(String.self, forKey: .text)
  }

}
