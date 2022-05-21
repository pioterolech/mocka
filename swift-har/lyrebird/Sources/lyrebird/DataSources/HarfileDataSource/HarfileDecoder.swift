import Foundation

enum HarfileDecoderError: Error {
    case unableToLoadHarFile
}

class HarfileDecoder {

    static func decode(fromURL: URL) throws -> HarFile {
        let contents = try String(contentsOfFile: fromURL.path)
        guard let data = contents.data(using: .utf8) else {
            throw HarfileDecoderError.unableToLoadHarFile
        }
        return try JSONDecoder().decode(HarFile.self, from: data)
    }
}
