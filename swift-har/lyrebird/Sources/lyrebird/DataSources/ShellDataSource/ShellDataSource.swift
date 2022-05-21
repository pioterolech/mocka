import Foundation

class ShellDataSource {
    @discardableResult
    static func executeShell(_ command: String) -> Process {
        let task = Process()

        task.arguments = ["-c", command]
        task.launchPath = "/bin/zsh"
        task.standardInput = nil

        return task
    }
}
