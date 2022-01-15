import Foundation

public enum Wordle {
    public enum Result: Character, CustomStringConvertible {
        case correctPosition = "g"
        case incorrectPosition = "y"
        case notPresent = "x"
        
        public var description: String {
            switch self {
            case .correctPosition:
                return "🟩"
            case .incorrectPosition:
                return "🟨"
            case .notPresent:
                return "⬛"
            }
        }
    }
    
    public static var todaysWord: String {
        let calendar = Calendar.current
        let date = calendar.date(
            from: DateComponents(year: 2021, month: 6, day: 19)
        )!
        
        let today = calendar.date(
            from: calendar.dateComponents([.year, .month, .day], from: Date())
        )!
        
        let interval = today.timeIntervalSince(date)
        let hash = Int((interval / 86400).rounded())
        
        let index = hash % Words.puzzleWords.count
        return Words.puzzleWords[index]
    }
}

public extension Array where Element == Wordle.Result {
    var description: String {
        map(\.description).joined()
    }
    
    static var solved: Self {
        Array(repeating: .correctPosition, count: 5)
    }
}
