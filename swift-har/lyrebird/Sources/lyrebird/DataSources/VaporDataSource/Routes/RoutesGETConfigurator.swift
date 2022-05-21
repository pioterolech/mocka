import Foundation
import Vapor

class RoutesGETConfigurator {
    func configure(_ app: Application, requestsData: [RequestData]) {
        for item in requestsData {
            app.on(item.method, item.pathComponents) { req -> String in
                guard item.responses.indices.contains(item.responseCount) else {
                    throw Abort(.badRequest, reason: "No requests from har file")
                }

                let response = item.responses[item.responseCount]

                guard let decoded = response.base64Decoded() else {
                    throw Abort(.badRequest, reason: "Unable to decode base 64")

                }

                item.responseCount += 1
                return decoded
            }
        }
    }
}

extension String {
    func base64Encoded() -> String? {
        return data(using: .utf8)?.base64EncodedString()
    }

    func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
