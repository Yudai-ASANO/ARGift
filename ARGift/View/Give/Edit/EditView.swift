//
//  CompleteView.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/24.
//

import SwiftUI

struct EditView: View {
    @ObservedObject var store: ARMarkerStore
    @StateObject private var viewModel: EditViewModel = .init()
    @State private var isPresented: Bool = false
    @State private var isActive: Bool = false
    
    var body: some View {
        if store.selectedImages.count < 3 {
            EmptyView()
        } else {
            VStack(alignment: .center, spacing: 40) {
                cell(index: 0)
                
                PinkButton(title: "OK", disabled: viewModel.validation()) {
                    store.selectedObjects = viewModel.objectUrls
                    store.selectedObjectImages = viewModel.objectImageUrls
                    isActive = true
                }
                
                NavigationLink("", isActive: $isActive) {
                    RegistView(store: store)
                }
            }
            .navigationTitle("演出を選んでください")
            .sheet(isPresented: $isPresented) {
                //dismiss
            } content: {
                PreviewWrapper(viewModel: viewModel)
            }

        }
    }
    
    @ViewBuilder
    private func cell(index: Int) -> some View {
        HStack(alignment: .center, spacing: 50) {
            Markerlmage(imageUrl: store.selectedImages, width: 117, disabled: true, isSelected: $viewModel.didSelectAt[index])
            VStack(alignment: .center, spacing: 20) {
                Text("マーカーその\(index + 1)")
                PinkButtonSmall(title: "編集") {
                    isPresented = true
                    viewModel.selectedCellIndex = index
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(.white)
    }
}

//struct CompleteView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditView()
//    }
//}
