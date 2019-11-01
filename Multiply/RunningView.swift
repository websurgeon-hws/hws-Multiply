//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import SwiftUI

struct RunningView: View {
    @ObservedObject var gameState: GameState

    @State private var currentQuestionIndex = 0
    
    var body: some View {
        return List {
            ForEach(self.gameState.questions) {
                Text("\($0.title)")
            }
        }
    }
}

struct RunningView_Previews: PreviewProvider {
    static var previews: some View {
        RunningView(gameState: GameState())
    }
}
