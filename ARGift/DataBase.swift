//
//  DataBaseStore.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/26.
//

import Foundation
import SwiftUI
import RealmSwift

public var arMarker: [String] = ["150x150", "150x150", "150x150", "150x150", "150x150", "150x150"]
public var usdzObject: [String] = ["LemonMeringuePie", "toy_biplane", "toy_drummer", "tv_retro"]
public var usdz: [USDZFile] = [
    USDZFile.init(image: "150x200", object: "LemonMeringuePie"),
    USDZFile.init(image: "150x200", object: "toy_biplane"),
    USDZFile.init(image: "150x200", object: "toy_drummer"),
    USDZFile.init(image: "150x200", object: "tv_retro")
]

public struct USDZFile {
    var imageUrl: String
    var objectUrl: String
    
    init(image: String, object: String) {
        self.imageUrl = image
        self.objectUrl = object
    }
}

final class DataBase: Object, Identifiable {
    @Persisted(primaryKey: true) var id = UUID().uuidString
    @Persisted var number: Int
    @Persisted var imageUrl: String
    @Persisted var usdzUrl: String
}
