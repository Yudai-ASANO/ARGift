//
//  PreviewView.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/26.
//

import SwiftUI

struct PreviewView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: EditViewModel
    @State private var selected: Int? = nil
    let columns: [GridItem] = .init(repeating: .init(.fixed(150), spacing: 20, alignment: .center), count: 2)
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .center, spacing: 50) {
                    LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
                        ForEach(0..<usdz.count, id: \.self) { index in
                            Button {
                                selected = index
                            } label: {
                                ZStack(alignment: .topTrailing) {
                                    Image(usdz[index].imageUrl)
                                    if selected == index {
                                        Image(systemName: "checkmark.circle.fill")
                                    }
                                }
                            }
                        }
                    }
                    
                    PinkButton(title: "ARで見る", disabled: selected == nil) {
                        viewModel.index = selected
                    }
                }
            }
            .navigationTitle("演出一覧")
            .toolbar(content: {
                Button {
                    if let selected = selected {
                        print("debug: \(selected)")
                        viewModel.didSelectAt[viewModel.selectedCellIndex] = true
                        viewModel.objectUrls[viewModel.selectedCellIndex] = usdz[selected].objectUrl
                        viewModel.objectImageUrls[viewModel.selectedCellIndex] = usdz[selected].imageUrl
                        dismiss()
                    }
                } label: {
                    Text("決定")
                        .foregroundColor(.black)
                }

            })
            .padding(.top)
        }
        
    }
}

struct PreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView(viewModel: .init())
    }
}
