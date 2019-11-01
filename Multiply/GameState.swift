//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import Foundation

class GameState: ObservableObject {
    enum Screen {
        case settings
        case running
    }
    
    @Published var screen: Screen = .settings
    @Published var multiplications: [Int]
    @Published var questionsLimit: Int?
    var questions: [Question]
    @Published var currentQuestionIndex: Int
    
    init(screen: Screen = .settings, multiplications: [Int]? = nil, questionsLimit: Int? = nil) {
        self.screen = screen
        let mult = multiplications ?? Array(2...12)
        self.multiplications = mult
        self.questionsLimit = questionsLimit
        currentQuestionIndex = 0
        questions = GameState.generateQuestions(for: mult, limit: questionsLimit)
    }
    
    func refresh() {
        currentQuestionIndex = 0
        questions = GameState.generateQuestions(for: multiplications, limit: questionsLimit)
    }
    
    private static func generateAllQuestions(for multiplications: [Int]) -> [Question] {
        var questions = [Question]()
        multiplications.forEach { multiplyBy in
            (2 ... 12).forEach { value in
                let question = Question(value: value,
                                        multiplyBy: multiplyBy)
                questions.append(question)
            }
        }
        return questions
    }
    
    private static func generateQuestions(for multiplications: [Int], limit: Int?) -> [Question] {
        let items = self.generateAllQuestions(for: multiplications).shuffled()
        if items.count > 0, let limit = limit {
            return Array(items.dropFirst(max(items.count - limit, 0)))
        } else {
            return items
        }
    }
}

