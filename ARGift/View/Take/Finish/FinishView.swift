//
//  FinishView.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/30.
//

import SwiftUI

struct FinishView: View {
    @EnvironmentObject var transitionManager: TransitionManager
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            Image("phone")
                .resizable()
                .frame(
                    width: 220,
                    height: 220,
                    alignment: .center
                )
            Spacer()
            PinkButton(title: "ホームへ戻る", action: {
                transitionManager.isPresented = false
            })
            .padding(.bottom, 60)
        }
        .navigationTitle("送信しました！")
    }
}

struct FinishView_Previews: PreviewProvider {
    static var previews: some View {
        FinishView()
    }
}
