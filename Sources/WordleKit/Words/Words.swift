import Foundation

public enum Words {
    public static let allWords = words(from: URL(fileURLWithPath: "/usr/share/dict/words"))
    
    private static func words(from url: URL) -> [String] {
        try! String(contentsOf: url)
            .components(separatedBy: "\n")
            .filter { $0.count == 5 }
            .filter { $0 == $0.lowercased() }
    }
}
