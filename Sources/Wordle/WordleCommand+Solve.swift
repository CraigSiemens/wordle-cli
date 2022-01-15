import ArgumentParser
import Foundation
import WordleKit

extension WordleCommand {
    struct Solve: ParsableCommand {
        static var configuration = CommandConfiguration(
            abstract: "Interactively solve a game of Wordle. Definitely not for cheating :D."
        )
        
        func run() throws {
            let solver = Wordle.Solver(words: Words.puzzleWords)
            
            while !solver.isSolved {
                let word = try solver.guessWord()
                print(word)
                
                print("Result: (xyg)")
                let rawResults = readLine(strippingNewline: true)!
                
                if rawResults.isEmpty,
                   let index = solver.words.firstIndex(of: word) {
                    solver.words.remove(at: index)
                    continue
                }
                
                let results = rawResults.compactMap(Wordle.Result.init)
                guard results.count == 5 else {
                    print("Expected five letters, try again.")
                    continue
                }
                
                solver.apply(result: results, for: word)

                print("")
            }
            
            print(solver.words.first!)
        }
    }
}
