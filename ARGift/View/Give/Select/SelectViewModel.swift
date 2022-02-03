//
//  SelectViewModel.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/23.
//

import UIKit
import SwiftUI

final class SelectViewModel: ObservableObject {
    @Published var didSelectAt: [Bool] = [false, false, false, false, false, false]
    
    func validation() -> Bool {
        var trueCounter: Int = 0
        didSelectAt.forEach { bool in
            if bool {
                trueCounter += 1
            }
        }
        if trueCounter == 1 {
            return false
        }
        
        return true
    }
    
    func selectedNumber() -> Int? {
        var selected: [Int] = []
        didSelectAt.indices.forEach { index in
            if didSelectAt[index] {
                selected.append(index)
            }
        }
        if selected.count != 1 {
            return nil
        } else {
            return selected[0]
        }
    }
}
