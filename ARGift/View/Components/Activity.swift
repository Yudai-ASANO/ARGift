//
//  Activity.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/24.
//

import SwiftUI

struct Activity: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIActivityViewController
    
    var items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller: UIActivityViewController = .init(activityItems: items, applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        // update
    }
}
