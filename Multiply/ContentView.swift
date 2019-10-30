//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private enum GameState {
        case settings
        case running
    }

    @State private var gameState = GameState.settings
    
    var body: some View {
        switch self.gameState {
        case .settings:
            return Text("Settings")
        case .running:
            return Text("Running")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
