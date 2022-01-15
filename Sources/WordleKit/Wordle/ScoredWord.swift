import Foundation

struct ScoredWord: Comparable {
    let word: String
    let score: Int
    
    init(word: String, letterScores: [Character: Int]) {
        self.word = word
        
        self.score = Set(word)
            .map { letterScores[$0] ?? 0 }
            .reduce(0, +)
    }
    
    static func == (lhs: ScoredWord, rhs: ScoredWord) -> Bool {
        lhs.score == rhs.score
    }
    
    static func < (lhs: ScoredWord, rhs: ScoredWord) -> Bool {
        lhs.score < rhs.score
    }
}
