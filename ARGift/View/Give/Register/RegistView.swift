//
//  RegistView.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/26.
//

import SwiftUI

struct RegistView: View {
    @ObservedObject var store: ARMarkerStore
    @State private var isActive: Bool = false
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .center, spacing: 20) {
                cell(index: 0)
                
                Text("pass: \(store.pass)")
                
                PinkButton(title: "OK") {
                    store.register()
                    isActive = true
                }
                .padding(.top, 20)
                
                NavigationLink("", isActive: $isActive) {
                    MarkerView()
                }
            }
        }
        .navigationTitle("これでいいですか？")
        .padding(.top, 20)
        .onAppear {
            store.createPass()
        }
    }
    
    @ViewBuilder
    private func cell(index: Int) -> some View {
        HStack(alignment: .center, spacing: 100) {
            Text("\(index + 1)")
                .foregroundColor(Color("#darkMaroon"))
                .font(.system(size: 42))
            Image(store.selectedObjectImages)
                .resizable()
                .frame(width: 116, height: 168, alignment: .center)
                .cornerRadius(9)
        }
    }
    
}

struct RegistView_Previews: PreviewProvider {
    static var previews: some View {
        RegistView(store: .init())
    }
}
