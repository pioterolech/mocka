import Foundation

extension Array where Element == Entries {
    func urlPaths() throws -> [String] {
        try map { element -> String in
            let url = URL(string: element.request.url)

            guard let pathElement = url?.path else {
                throw VaporDataSourceError.invalidURL
            }

            let pathString = String(pathElement.dropFirst())

            return pathString
        }
    }
}

enum VaporDataSourceError: Error {
    case invalidURL
}
