//
//  Response.swift
//
//  Created by Piotr Olechnowicz on 18/05/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Response: Codable {

  enum CodingKeys: String, CodingKey {
    case status
    case headersSize
    case redirectURL
    case statusText
    case bodySize
    case content
    case httpVersion
    case headers
  }

  var status: Int
  var headersSize: Int
  var redirectURL: String
  var statusText: String
  var bodySize: Int
  var content: Content
  var httpVersion: String
  var headers: [Headers]



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    status = try container.decode(Int.self, forKey: .status)
    headersSize = try container.decode(Int.self, forKey: .headersSize)
    redirectURL = try container.decode(String.self, forKey: .redirectURL)
    statusText = try container.decode(String.self, forKey: .statusText)
    bodySize = try container.decode(Int.self, forKey: .bodySize)
    content = try container.decode(Content.self, forKey: .content)
    httpVersion = try container.decode(String.self, forKey: .httpVersion)
    headers = try container.decode([Headers].self, forKey: .headers)
  }

}
