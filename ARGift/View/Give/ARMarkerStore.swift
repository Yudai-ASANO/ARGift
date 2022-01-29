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
    @Published var selectedImages: [String] = ["", "", ""]
    @Published var selectedImagesResources: [String] = ["", "", ""]
    @Published var selectedObjects: [String] = ["", "", ""]
    @Published var selectedObjectImages: [String] = ["", "", ""]
    @Published var pass: Int = 0
    
    func imageSelect(number1: Int, number2: Int, number3: Int) {
        selectedImages[0] = arMarker[number1].imageUrl
        selectedImagesResources[0] = arMarker[number1].resource
        selectedImages[1] = arMarker[number2].imageUrl
        selectedImagesResources[1] = arMarker[number2].resource
        selectedImages[2] = arMarker[number3].imageUrl
        selectedImagesResources[2] = arMarker[number3].resource
    }
    
    func objectSelect(number1: Int, number2: Int, number3: Int) {
        selectedObjects[0] = usdz[number1].objectUrl
        selectedObjects[1] = usdz[number2].objectUrl
        selectedObjects[2] = usdz[number3].objectUrl
    }
    
    func createPass() {
        pass = Int.random(in: 1000 ..< 9999)
    }
    
    func register() {
        do {
            let dataBase: [DataBase] = [.init(), .init(), .init()]
            for index in 0..<3 {
                dataBase[index].imageResource = selectedImagesResources[index]
                dataBase[index].imageUrl = selectedImages[index]
                dataBase[index].usdzUrl = selectedObjects[index]
                dataBase[index].number = pass
            }
            let realm = try Realm()
            print("file: \(Realm.Configuration.defaultConfiguration.fileURL!)")
            try realm.write({
                dataBase.forEach { data in
                    realm.add(data)
                }
            })
            
        } catch {
            print(error)
        }
    }
}
