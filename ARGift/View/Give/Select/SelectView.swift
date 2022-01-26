//
//  SelectView.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/23.
//

import SwiftUI

struct SelectView: View {
    private let hSpacing: CGFloat = 26.0
    private let vSpacing: CGFloat = 26.0
    @State private var isPresented: Bool = false
    @StateObject var viewModel: SelectViewModel = .init()
    @StateObject var store: ARMarkerStore = .init()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .center, spacing: vSpacing) {
                    HStack(alignment: .center, spacing: hSpacing) {
                        Markerlmage(imageUrl: arMarker[0], isSelected: $viewModel.didSelectAt[0])
                        Markerlmage(imageUrl: arMarker[1], isSelected: $viewModel.didSelectAt[1])
                    }
                    
                    HStack(alignment: .center, spacing: hSpacing) {
                        Markerlmage(imageUrl: arMarker[2], isSelected: $viewModel.didSelectAt[2])
                        Markerlmage(imageUrl: arMarker[3], isSelected: $viewModel.didSelectAt[3])
                    }
                    
                    HStack(alignment: .center, spacing: hSpacing) {
                        Markerlmage(imageUrl: arMarker[4], isSelected: $viewModel.didSelectAt[4])
                        Markerlmage(imageUrl: arMarker[5], isSelected: $viewModel.didSelectAt[5])
                    }
                    
                    PinkButton(title: "OK", disabled: viewModel.validation(), action: {
                        guard let selected = viewModel.selectedNumber() else { return }
                        store.imageSelect(number1: selected.0, number2: selected.1, number3: selected.2)
                        print("debug: \(selected)")
                        isPresented = true
                    })
                    .padding(.vertical, 40)
                    
                    NavigationLink("", isActive: $isPresented) {
                        PrinterView(store: store)
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("マーカーを選択")
        }
    }
}

struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        SelectView()
    }
}
