//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    let multiplicationOptions = Array(2...12)
    @State private var selectedNumberOfQuestions = "10"
    let numberOfQuestions = ["5" , "10", "20", "All"]
    @State private var selectedMultiplications = Array(2...12)
    
    var body: some View {
        Form {
            Section(header: Text("Number of questions")) {
                Picker(selection: self.$selectedNumberOfQuestions,
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
                            if self.selectedMultiplications.contains(number) {
                                self.selectedMultiplications
                                    .removeAll(where: { $0 == number })
                            } else {
                                self.selectedMultiplications
                                    .append(number)
                            }
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
        if self.selectedMultiplications.contains(number) {
            return AnyView(Image(systemName: "checkmark"))
        }
        return AnyView(Text(""))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
