import Vapor
import Foundation

class VaporDataSource {
    private let app: Application
    private let hostData: HostData
    private let routesConfigurator: RoutesConfigurator

    init(hostData: HostData,
         routesConfigurator: RoutesConfigurator) throws {
        self.hostData = hostData
        self.routesConfigurator = routesConfigurator
        self.app = .init()
        try self.routesConfigurator.configure(app, hostData: hostData)
        app.http.server.configuration.port = hostData.port
    }

    func serve() throws {
        try app.server.start()
        print(app.routes.all)
    }

    deinit {
        app.server.shutdown()
    }
}
