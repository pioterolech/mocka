import Foundation
import Vapor


class RoutesConfigurator {
    private let getConfigurator = RoutesGETConfigurator()

    func configure(_ app: Application, hostData: HostData) throws {
        try configure(app, hostData: hostData, method: .GET)
        try configure(app, hostData: hostData, method: .POST)
        try configure(app, hostData: hostData, method: .PROPFIND)
    }

    func configure(_ app: Application, hostData: HostData, method: HTTPMethod) throws {
        let getEntries = hostData.requests.filter { $0.request.method == method.rawValue }
        let allPaths = try getEntries.urlPaths()
        let uniquePaths = Array(Set(allPaths))

        let requestsData = uniquePaths.map { element -> RequestData in
            let entriesForPath = getEntries.filter { $0.request.url.contains(element) }
            return RequestData(method: method,
                               pathComponents: element.createPathComponents(),
                               responses: entriesForPath.map { $0.response.content.text } )
        }

        getConfigurator.configure(app, requestsData: requestsData)
    }
}

class RequestData {
    let method: HTTPMethod
    let pathComponents: [PathComponent]
    let responses: [String]
    var responseCount = 0

    init(method: HTTPMethod,
         pathComponents: [PathComponent],
         responses: [String]) {
        self.method = method
        self.pathComponents = pathComponents
        self.responses = responses
    }
}
