//import ArgumentParser
//
//struct StartCommand: ParsableCommand {
//    static var configuration: CommandConfiguration {
//        .init(
//            commandName: "start",
//            abstract: "Start the servers"
//        )
//    }
//
//    @Argument(help: "Har file path") var harFilePath: String
//
//    func run() throws {
//        try MockServer.shared.start(harFilePath: harFilePath)
//    }
//}
