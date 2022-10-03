import Foundation

extension HarFile {
    var uniqueHosts: [String] {
        let requests = log.entries.map { $0.request }
        let urls = requests.map { $0.url }
        let uniqueURLs = Array(Set(urls))
        let hosts = uniqueURLs.map { URL(string: $0)!.host! }

        return Array(Set(hosts)).sorted()
    }
}
