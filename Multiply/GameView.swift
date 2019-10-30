//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import SwiftUI

struct GameView: View {
    private enum GameState {
        case settings
        case running
    }

    @State private var gameState = GameState.settings
    
    var body: some View {
        switch self.gameState {
        case .settings: return AnyView(SettingsView())
        case .running: return AnyView(RunningView())
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
