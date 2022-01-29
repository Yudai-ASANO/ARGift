//
//  OpenView.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/29.
//

import SwiftUI

struct OpenView: View {
    var pass: Int
    @State private var isActive: Bool = false
    @StateObject private var viewModel: OpenViewModel = .init()
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            Image("present_orange")
                .resizable()
                .frame(
                    width: 220,
                    height: 220,
                    alignment: .center
                )
            Spacer()
            PinkButton(title: "OPEN", action: {
                isActive = true
            })
            .padding(.bottom, 60)
            
            NavigationLink("", isActive: $isActive) {
//                ARContentsViewContainer(attribute: .init(order: 1, imageUrl: , objectUrl: <#T##String#>))
            }
        }
        .navigationTitle("プレゼントです！")
        .onAppear {
            viewModel.fetchData(pass: pass)
        }
    }
}

struct OpenView_Previews: PreviewProvider {
    static var previews: some View {
        OpenView(pass: 3)
    }
}
