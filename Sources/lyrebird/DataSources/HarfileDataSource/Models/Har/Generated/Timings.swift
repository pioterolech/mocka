//
//  Timings.swift
//
//  Created by Piotr Olechnowicz on 18/05/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Timings: Codable {

  enum CodingKeys: String, CodingKey {
    case receive
    case ssl
    case blocked
    case connect
    case dns
    case send
    case wait
  }

  var receive: Int
  var ssl: Int
  var blocked: Int
  var connect: Int
  var dns: Int
  var send: Int
  var wait: Int



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    receive = try container.decode(Int.self, forKey: .receive)
    ssl = try container.decode(Int.self, forKey: .ssl)
    blocked = try container.decode(Int.self, forKey: .blocked)
    connect = try container.decode(Int.self, forKey: .connect)
    dns = try container.decode(Int.self, forKey: .dns)
    send = try container.decode(Int.self, forKey: .send)
    wait = try container.decode(Int.self, forKey: .wait)
  }

}
