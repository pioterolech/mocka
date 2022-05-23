import RoutingKit
import Foundation

extension String {

    func createPathComponents() -> [PathComponent] {
        self.dropFirst().components(separatedBy: "/").map { PathComponent(stringLiteral: $0) }
    }
}
