import Foundation
import Vapor

class RoutesGETConfigurator {
    func configure(_ app: Application, requestsData: [RequestData]) {
        for item in requestsData {
            app.on(item.method, item.pathComponents) { req async throws ->  MockResponse in

                return try MockResponse(item: item)
            }
        }
    }
}
struct MockResponse: AsyncResponseEncodable {
    let headers: HTTPHeaders
    let status: HTTPResponseStatus
    let body: String

    public func encodeResponse(for request: Request) async throws -> Response {
        return .init(status: .ok, headers: headers, body: .init(string: body))
    }

    init(item: RequestData) throws {
        guard item.responseData.indices.contains(item.responseCount) else {
            throw Abort(.badRequest, reason: "No requests from har file")
        }

        let response = item.responseData[item.responseCount]

        guard let decoded = response.response.base64Decoded() else {
            throw Abort(.badRequest, reason: "Unable to decode base 64")
        }

        item.responseCount += 1
        
        let headersData: [(String, String)] = response.headers.reduce(into: []) { partialResult, element in
            if element.name == "Content-Type" {
                partialResult.append((element.name, element.value))
            }
        }
        
        self.headers = HTTPHeaders(headersData)
        self.status = .ok
        self.body = decoded
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
