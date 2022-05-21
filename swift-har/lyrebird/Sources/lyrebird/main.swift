import ArgumentParser
import Foundation

enum Command {}

extension Command {
  struct Main: ParsableCommand {
    static var configuration: CommandConfiguration {
      .init(
        commandName: "lyrebird",
        abstract: "Create local http services from har files",
        version: "0.0.1",
        subcommands: [
            StartCommand.self
        ]
      )
    }
  }
}

Command.Main.main()
