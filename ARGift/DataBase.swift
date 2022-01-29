//
//  DataBaseStore.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/26.
//

import Foundation
import SwiftUI
import RealmSwift

//public var arMarker: [String] = ["bear", "flowers", "presentforyou", "bouquet", "congratulation", "150x150"]
public var usdzObject: [String] = ["LemonMeringuePie", "toy_biplane", "toy_drummer", "tv_retro"]
public var usdz: [USDZFile] = [
    USDZFile.init(image: "150x200", object: "LemonMeringuePie"),
    USDZFile.init(image: "150x200", object: "toy_biplane"),
    USDZFile.init(image: "150x200", object: "toy_drummer"),
    USDZFile.init(image: "150x200", object: "tv_retro")
]
public var arMarker: [ARMarker] = [
    ARMarker.init(image: "bear", resource: "AR_BEAR"),
    ARMarker.init(image: "flowers", resource: "AR_FLOWERS"),
    ARMarker.init(image: "presentforyou", resource: "AR_PRESENTFORYOU"),
    ARMarker.init(image: "bouquet", resource: "AR_BOUQUET"),
    ARMarker.init(image: "congratulation", resource: "AR_CONGRATULATION"),
    ARMarker.init(image: "150x200", resource: "AR Resources")
]

public struct ARMarker {
    var imageUrl: String
    var resource: String
    
    init(image: String, resource: String) {
        self.imageUrl = image
        self.resource = resource
    }
}

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
    @Persisted var imageResource: String
    @Persisted var imageUrl: String
    @Persisted var usdzUrl: String
}
