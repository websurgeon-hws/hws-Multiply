//
//  Copyright © 2019 Peter Barclay. All rights reserved.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let value: Int
    let multiplyBy: Int
    var answer: Int {
        return value * multiplyBy
    }
    
    var title: String {
        return "\(value) x \(multiplyBy) = ?"
    }
}
