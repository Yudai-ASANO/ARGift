//
//  EditViewModel.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/26.
//

import SwiftUI
import RealmSwift

final class EditViewModel: ObservableObject {
    @Published var didSelectAt: [Bool] = [false, false, false]
    @Published var objectUrls:[String] = ["", "", ""]
    @Published var objectImageUrls: [String] = ["", "", ""]
    @Published var selectedCellIndex: Int = -1
    @Published var index: Int?
    
    func validation() -> Bool {
        var trueCounter: Int = 0
        didSelectAt.forEach { bool in
            if bool {
                trueCounter += 1
            }
        }
        if trueCounter == 3 {
            return false
        }
        
        return true
    }
}
