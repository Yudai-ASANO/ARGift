//
//  HomeView.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/23.
//

import SwiftUI

struct HomeView: View {
    
    enum ViewType {
        case give
        case take
    }
    
    private let spacing: CGFloat = 5
    @State private var type: ViewType?
    @StateObject private var transitionManager: TransitionManager = .init()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                HStack(alignment: .center, spacing: spacing) {
                    Button {
                        type = .give
                        transitionManager.isPresented = true
                    } label: {
                        Image("home_give")
                            .resizable()
                            .frame(
                                width: (UIScreen.main.bounds.width - 5 * spacing) / 2,
                                height: (UIScreen.main.bounds.width - 5 * spacing) / 2 * (927 / 378),
                                alignment: .center
                            )
                    }
                    Button {
                        type = .take
                        transitionManager.isPresented = true
                    } label: {
                        Image("home_get")
                            .resizable()
                            .frame(
                                width: (UIScreen.main.bounds.width - 5 * spacing) / 2,
                                height: (UIScreen.main.bounds.width - 5 * spacing) / 2 * (927 / 378),
                                alignment: .center
                            )
                    }
                }
            }
            .padding(.horizontal, 2*spacing)
            .padding(.top)
            .navigationTitle("ようこそ！")
            .ignoresSafeArea()
        }
        .fullScreenCover(isPresented: $transitionManager.isPresented) {
            // dismiss
        } content: {
            switch type {
            case .give:
                SelectView()
                    .environmentObject(transitionManager)
            case .take:
                AuthentiacationView()
                    .environmentObject(transitionManager)
            default:
                Text("エラー")
            }
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
