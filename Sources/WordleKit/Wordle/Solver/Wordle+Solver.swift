import Foundation

extension Wordle {
    public final class Solver {
        public var words: [String]
        public var isSolved: Bool { words.count == 1 }
        
        let strategy: Strategy
        
        public init<C>(words: C, strategy: Strategy = .uncommonLetters) where C: Collection, C.Element == String {
            self.words = Array(words)
            self.strategy = strategy
        }
        
        public func guessWord() throws -> String {
            try strategy.guessWord(from: words)
        }
        
        public func apply(result: [Result], for word: String) {
            for (result, (character, index)) in zip(result, zip(word, word.indices)) {
                
                switch result {
                case .correctPosition:
                    words = words
                        .filter { word in
                            word[index] == character
                        }
                case .incorrectPosition:
                    words = words
                        .filter { word in
                            word[index] != character
                            && word.contains(character)
                        }
                case .notPresent:
                    words = words
                        .filter { word in
                            !word.contains(character)
                        }
                }
            }
        }
    }
}
