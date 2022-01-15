import Foundation

public extension Strategy where Self == CommonLettersStrategy {
    static var commonLetters: Self {
        CommonLettersStrategy()
    }
}

public struct CommonLettersStrategy: Strategy {
    public func guessWord(from words: [String]) throws -> String {
        var wordsWithLetter: [Character: Int] = [:]
        
        for word in words {
            for letter in Set(word) {
                wordsWithLetter[letter, default: 0] += 1
            }
        }
        
        let scoredWords = words
            .map { ScoredWord(word: $0, letterScores: wordsWithLetter) }
        
        guard let word = scoredWords.max()?.word else {
            throw StrategyError.noGuessAvailable
        }
        
        return word
    }
}
