//
//  PrinterView.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/26.
//

import SwiftUI

struct PrinterView: View {
    @ObservedObject var store: ARMarkerStore
    @State private var showActivity: Bool = false
    @State private var isActive: Bool = false
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            Button {
                showActivity = true
            } label: {
                Image("printer")
                    .resizable()
                    .frame(
                        width: 220,
                        height: 220,
                        alignment: .center
                    )
            }
            Spacer()
            PinkButton(title: "印刷完了", action: {
                isActive = true
            })
            .padding(.bottom, 60)
            
            NavigationLink("", isActive: $isActive) {
                EditView(store: store)
            }
        }
        .navigationTitle("印刷してください")
        .sheet(isPresented: $showActivity) {
            // dismiss
        } content: {
            let shareImages: [UIImage?] = [
                UIImage(named: store.selectedImages[0]),
                UIImage(named: store.selectedImages[1]),
                UIImage(named: store.selectedImages[2])
            ]
            Activity(items: shareImages)
        }


    }
}

//struct PrinterView_Previews: PreviewProvider {
//    static var previews: some View {
//        PrinterView()
//    }
//}
