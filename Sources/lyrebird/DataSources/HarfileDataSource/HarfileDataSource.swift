//
//  File.swift
//  
//
//  Created by Piotr Olechnowicz on 19/05/2022.
//

import Foundation


class HarfileDataSource {
    static let shared = HarfileDataSource()

    func createHarLog(path: String) throws -> [HostData] {
        let filepath = URL(fileURLWithPath: path)
        let decoded = try HarfileDecoder.decode(fromURL: filepath)
        let uniqueHosts = decoded.uniqueHosts

        let hostMap: [HostData] = uniqueHosts.reduce(into: []) { accu, element in
            let port = 8000 + accu.count
            print(element + "-> localhost:" + String(port))
            let hostRequests = decoded.log.entries.filter {
                $0.request.url.contains(element)
            }

            let hostData = HostData(hostName: element,
                                    port: 8000 + accu.count,
                                    requests: hostRequests)

            accu.append(hostData)
        }

        return hostMap
    }
}
