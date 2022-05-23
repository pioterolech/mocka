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
            let responseData: [ResponseData] = entriesForPath.map { ResponseData(response: $0.response.content.text, headers: $0.response.headers)
            }
            return RequestData(method: method,
                               pathComponents: element.createPathComponents(),
                               responseData: responseData)
        }
        
        getConfigurator.configure(app, requestsData: requestsData)
    }
}

class RequestData {
    let method: HTTPMethod
    let responseData: [ResponseData]
    let pathComponents: [PathComponent]
    var responseCount = 0
    
    init(method: HTTPMethod,
         pathComponents: [PathComponent],
         responseData: [ResponseData]) {
        self.method = method
        self.pathComponents = pathComponents
        self.responseData = responseData
    }
}

struct ResponseData {
    let response: String
    let headers: [Headers]
}
