//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var gameState: GameState = GameState(questionsLimit: 10)
        
    var body: some View {
        initialView()
    }
    
    private func initialView() -> some View {
        switch self.gameState.screen {
        case .settings: return AnyView(settingsView())
        case .running: return AnyView(runningView())
        }
    }
    
    private func settingsView() -> some View {
        NavigationView {
            SettingsView(gameState: self.gameState)
                .navigationBarTitle("Settings")
                .navigationBarItems(leading:
                    Button("Start") {
                        self.gameState.screen = .running
                    }
                )
        }
    }
    
    private func runningView() -> some View {
        NavigationView {
            RunningView(gameState: self.gameState)
            .navigationBarTitle("Multiply")
            .navigationBarItems(leading:
                Button("Settings") {
                    self.gameState.screen = .settings
                }
            )
        }
    }
    
    
}

struct GameView_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            GameView(gameState: GameState(screen: .settings))
            GameView(gameState: GameState(screen: .running))
        }
    }
}
