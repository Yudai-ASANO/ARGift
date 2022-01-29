//
//  AuthentiacationView.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/26.
//

import SwiftUI

struct AuthentiacationView: View {
    @StateObject private var viewModel: AuthenticationViewModel = .init()
    @State private var isActive: Bool = false
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                Spacer()
                TextField("password", text: $viewModel.password)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                    .padding()
                Spacer()
                OrangeButton(title: "OK", disabled: viewModel.password.isEmpty) {
                    isActive = true
                }
                NavigationLink("", isActive: $isActive) {
                    OpenView(pass: Int(viewModel.password) ?? 0)
                }
            }
            .navigationTitle("パスワードを入力")
        }
    }
}

struct AuthentiacationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthentiacationView()
    }
}
