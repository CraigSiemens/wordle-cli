import ArgumentParser
import Foundation
import WordleKit

@main
struct WordleCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "wordle",
        abstract: "Wordle in your terminal.",
        subcommands: [
            Play.self,
            Solve.self
        ]
    )
    
    enum StrategyOption: String, ExpressibleByArgument {
        case commonLetters = "common-letters"
        case uncommonLetters = "uncommon-letters"
        
        var strategy: Strategy {
            switch self {
            case .commonLetters:
                return .commonLetters
            case .uncommonLetters:
                return .uncommonLetters
            }
        }
    }
}
