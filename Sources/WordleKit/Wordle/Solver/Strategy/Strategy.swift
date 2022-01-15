import Foundation

public protocol Strategy {
    func guessWord(from words: [String]) throws -> String
}

enum StrategyError: Error {
    case noGuessAvailable
}
