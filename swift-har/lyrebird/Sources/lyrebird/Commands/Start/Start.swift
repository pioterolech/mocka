//
//  Start.swift
//  
//
//  Created by Piotr Olechnowicz on 19/05/2022.
//

import ArgumentParser

struct StartCommand: ParsableCommand {
    static var configuration: CommandConfiguration {
        .init(
            commandName: "start",
            abstract: "Start the servers"
        )
    }

    func run() throws {
        try MockServer.shared.start()
    }
}
