//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import SwiftUI

struct GameView: View {
    enum GameState {
        case settings
        case running
    }
        
    @State var gameState: GameState = .settings

    var body: some View {
        initialView()
    }
    
    private func initialView() -> some View {
        switch self.gameState {
        case .settings: return AnyView(settingsView())
        case .running: return AnyView(runningView())
        }
    }
    
    private func settingsView() -> some View {
        NavigationView {
            SettingsView()
                .navigationBarTitle("Settings")
                .navigationBarItems(leading:
                    Button("Start") {
                        self.gameState = .running
                    }
                )
        }
    }
    
    private func runningView() -> some View {
        NavigationView {
            RunningView()
            .navigationBarTitle("Multiply")
            .navigationBarItems(leading:
                Button("Settings") {
                    self.gameState = .settings
                }
            )
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GameView(gameState: .settings)
            GameView(gameState: .running)
        }
    }
}
