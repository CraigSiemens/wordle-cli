import ArgumentParser
import Foundation

extension Wordle {
    public final class Game {
        public enum Word: EnumerableFlag {
            case daily
            case random
        }
        
        private let word: String
        
        public private(set) var results: [[Result]] = []
        
        public var shareResult: String {
            results.map(\.description).joined(separator: "\n")
        }
        
        public init(word: Word) {
            switch word {
            case .daily:
                self.word = Wordle.todaysWord
            case .random:
                self.word = Words.puzzleWords.randomElement()!
            }
        }
        
        public init(word: String) {
            self.word = word
        }
        
        public func result(for guess: String) -> [Result] {
            let result = zip(guess, word)
                .map { g, w -> Result in
                    if g == w {
                        return .correctPosition
                    } else if word.contains(g) {
                        return .incorrectPosition
                    } else {
                        return .notPresent
                    }
                }
            
            results.append(result)
            
            return result
        }
    }
}
