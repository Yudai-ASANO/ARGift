//
//  ARMarkerStore.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/26.
//

import Foundation
import SwiftUI
import RealmSwift

final class ARMarkerStore: ObservableObject {
    @Published var selectedImages: String = ""
    @Published var selectedImagesResources: String = ""
    @Published var selectedObjects: String = ""
    @Published var selectedObjectImages: String = ""
    @Published var pass: Int = 0
    
    func imageSelect(number: Int) {
        selectedImages = arMarker[number].imageUrl
        selectedImagesResources = arMarker[number].resource
    }
    
    func objectSelect(number: Int) {
        selectedObjects = usdz[number].objectUrl
    }
    
    func createPass() {
        pass = Int.random(in: 1000 ..< 9999)
    }
    
    func register() {
        do {
            let dataBase: DataBase = .init()
            dataBase.imageResource = selectedImagesResources
            dataBase.imageUrl = selectedImages
            dataBase.usdzUrl = selectedObjects
            dataBase.number = pass
            let realm = try Realm()
            print("file: \(Realm.Configuration.defaultConfiguration.fileURL!)")
            try realm.write({
                realm.add(dataBase)
            })
            
        } catch {
            print(error)
        }
    }
}
