//
//  PostData.swift
//
//  Created by Piotr Olechnowicz on 18/05/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct PostData: Codable {
  enum CodingKeys: String, CodingKey {
    case mimeType
    case text
  }

  var mimeType: String
  var text: String



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    mimeType = try container.decode(String.self, forKey: .mimeType)
    text = try container.decode(String.self, forKey: .text)
  }
}
