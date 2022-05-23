//
//  Request.swift
//
//  Created by Piotr Olechnowicz on 18/05/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct HarRequest: Codable {

  enum CodingKeys: String, CodingKey {
    case method
    case headersSize
    case bodySize
    case url
    case postData
    case httpVersion
    case headers
  }

  var method: String
  var headersSize: Int
  var bodySize: Int
  var url: String
  var postData: PostData?
  var httpVersion: String
  var headers: [Headers]



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    method = try container.decode(String.self, forKey: .method)
    headersSize = try container.decode(Int.self, forKey: .headersSize)
    bodySize = try container.decode(Int.self, forKey: .bodySize)
    url = try container.decode(String.self, forKey: .url)
    postData = try container.decodeIfPresent(PostData.self, forKey: .postData)
    httpVersion = try container.decode(String.self, forKey: .httpVersion)
    headers = try container.decode([Headers].self, forKey: .headers)
  }

}
