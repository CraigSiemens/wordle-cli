import ArgumentParser
import Foundation
import WordleKit

extension WordleCommand {
    struct Play: ParsableCommand {
        static var configuration = CommandConfiguration(
            abstract: "Play a game of Wordle."
        )
        
        @Flag
        var word = Wordle.Game.Word.daily
        
        func run() {
            let game = Wordle.Game(word: word)
            
            while game.results.last != .solved {
                print("Word:")
                let word = readLine(strippingNewline: true)!
                
                print(game.result(for: word).description)
                print("")
            }
            
            print("\n\(game.shareResult)")
        }
    }
}
