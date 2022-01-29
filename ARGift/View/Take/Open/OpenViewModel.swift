//
//  OpenViewModel.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/29.
//

import SwiftUI
import RealmSwift

final class OpenViewModel: ObservableObject {
    @Published var data: [DataBase] = []
    
    func fetchData(pass: Int) {
        do {
            let realm = try Realm()
            let response = realm.objects(DataBase.self).filter("number == \(pass)")
            guard response.count == 3 else { return }
            data = Array(response)
            print(data)
        } catch {
            print(error)
        }
    }
}
