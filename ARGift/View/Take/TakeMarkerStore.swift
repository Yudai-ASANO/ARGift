//
//  TakeMarkerStore.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/29.
//

import SwiftUI

final class TakeMarkerStore: ObservableObject {
    @Published var data: DataBase = .init()
    @Published var pass: Int = 0
}
