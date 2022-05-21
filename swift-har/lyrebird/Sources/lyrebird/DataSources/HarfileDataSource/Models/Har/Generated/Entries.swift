//
//  Entries.swift
//
//  Created by Piotr Olechnowicz on 18/05/2022
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Entries: Codable {

  enum CodingKeys: String, CodingKey {
    case clientPort = "_clientPort"
    case clientName = "_clientName"
    case timings
    case name = "_name"
    case clientAddress = "_clientAddress"
    case response
    case startedDateTime
    case isIntercepted = "_isIntercepted"
    case id = "_id"
    case serverAddress = "_serverAddress"
    case time
    case isHTTPS = "_isHTTPS"
    case request
    case comment
    case clientBundlePath = "_clientBundlePath"
    case serverIPAddress
    case serverPort = "_serverPort"
  }

  var clientPort: Int
  var clientName: String
  var timings: Timings
  var name: String
  var clientAddress: String
  var response: Response
  var startedDateTime: String
  var isIntercepted: Bool
  var id: String
  var serverAddress: String
  var time: Float
  var isHTTPS: Bool
  var request: Request
  var comment: String
  var clientBundlePath: String
  var serverIPAddress: String
  var serverPort: Int



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    clientPort = try container.decode(Int.self, forKey: .clientPort)
    clientName = try container.decode(String.self, forKey: .clientName)
    timings = try container.decode(Timings.self, forKey: .timings)
    name = try container.decode(String.self, forKey: .name)
    clientAddress = try container.decode(String.self, forKey: .clientAddress)
    response = try container.decode(Response.self, forKey: .response)
    startedDateTime = try container.decode(String.self, forKey: .startedDateTime)
    isIntercepted = try container.decode(Bool.self, forKey: .isIntercepted)
    id = try container.decode(String.self, forKey: .id)
    serverAddress = try container.decode(String.self, forKey: .serverAddress)
    time = try container.decode(Float.self, forKey: .time)
    isHTTPS = try container.decode(Bool.self, forKey: .isHTTPS)
    request = try container.decode(Request.self, forKey: .request)
    comment = try container.decode(String.self, forKey: .comment)
    clientBundlePath = try container.decode(String.self, forKey: .clientBundlePath)
    serverIPAddress = try container.decode(String.self, forKey: .serverIPAddress)
    serverPort = try container.decode(Int.self, forKey: .serverPort)
  }

}
