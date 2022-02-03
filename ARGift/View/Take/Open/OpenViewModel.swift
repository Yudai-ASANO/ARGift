//
//  OpenViewModel.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/29.
//

import SwiftUI
import RealmSwift

final class OpenViewModel: ObservableObject {
    @Published var data: DataBase = .init()
    
    func fetchData(pass: Int) {
        do {
            let realm = try Realm()
            let response = realm.objects(DataBase.self).filter("number == \(pass)")
            print(response)
            guard let data = response.first else { return }
            self.data = data
            print(data)
        } catch {
            print(error)
        }
    }
}
