//
//  CompleteView.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/27.
//

import SwiftUI

struct CompleteView: View {
    @EnvironmentObject var transitionManager: TransitionManager
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            Image("present")
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
        .navigationTitle("完成")
    }
}

struct CompleteView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView()
    }
}
