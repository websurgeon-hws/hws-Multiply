//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var gameState: GameState

    let multiplicationOptions = Array(2...12)
    let numberOfQuestions = ["5" , "10", "20", "All"]
    
    var body: some View {
        let selectedNumberOfQuestions = Binding<String>(get: {
            if let limit = self.gameState.questionsLimit {
                return "\(limit)"
            } else {
                return "All"
            }
        }, set: { newValue in
            self.gameState.questionsLimit = Int(newValue)
            self.gameState.refresh()
        })
                
        return Form {
            Section(header: Text("Number of questions")) {
                Picker(selection: selectedNumberOfQuestions,
                       label: Text("Number of questions")) {
                    ForEach(self.numberOfQuestions, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("Include Multiplications Tables")) {
                List {
                    ForEach(self.multiplicationOptions, id: \.self) { number in
                        Button(action: {
                            if self.gameState.multiplications.contains(number) {
                                self.gameState.multiplications
                                    .removeAll(where: { $0 == number })
                            } else {
                                self.gameState.multiplications
                                    .append(number)
                            }
                            self.gameState.refresh()
                        }) {
                            HStack {
                                Text("x \(number)")
                                    .foregroundColor(.primary)
                                Spacer()
                                self.selectedView(number: number)
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func selectedView(number: Int) -> some View {
        if self.gameState.multiplications.contains(number) {
            return AnyView(Image(systemName: "checkmark"))
        }
        return AnyView(Text(""))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(gameState: GameState())
    }
}
