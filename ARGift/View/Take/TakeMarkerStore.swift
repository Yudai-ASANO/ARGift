//
//  TakeMarkerStore.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/29.
//

import SwiftUI

final class TakeMarkerStore: ObservableObject {
    @Published var selectedImages: [String] = ["", "", ""]
    @Published var selectedObjects: [String] = ["", "", ""]
    @Published var selectedObjectImages: [String] = ["", "", ""]
    @Published var pass: Int = 0
}
