import Foundation

public class MockServer {
    static let shared = MockServer()
    private var servers: [VaporDataSource] = []
    private let dispatchQueue: DispatchQueue = .global()

    public func start(harFilePath: String) throws {
        let harlog = try HarfileDataSource.shared.createHarLog(path: harFilePath)
        let group = DispatchGroup()
        group.enter()

        dispatchQueue.async { [weak self] in
            for item in harlog {
                do {
                    let vapor = try VaporDataSource(hostData: item, routesConfigurator: .init())
                    self?.servers.append(vapor)
                    try vapor.serve()
                } catch {
                    print(error)
                }
            }
        }

        group.wait()
    }
}
