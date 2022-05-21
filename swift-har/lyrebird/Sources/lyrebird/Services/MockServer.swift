//
//  File.swift
//  
//
//  Created by Piotr Olechnowicz on 19/05/2022.
//

import Foundation

class MockServer {
    static let shared = MockServer()
    private var servers: [VaporDataSource] = []
    private let dispatchQueue: DispatchQueue = .global()

    func start() throws {
        let hostData = try HarfileDataSource.shared.hostsData()
        let group = DispatchGroup()
        group.enter()

        dispatchQueue.async { [weak self] in
            for item in hostData {
                do {
                    let vapor = try VaporDataSource(hostData: item, routesConfigurator: .init())
                    self?.servers.append(vapor)
                    try vapor.serve()
                } catch {
                    print(error)
                }
            }
        }

        group.wait()
    }
}
