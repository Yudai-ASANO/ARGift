//
//  MarkerView.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/27.
//

import SwiftUI

struct MarkerView: View {
    @State private var isActive: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Spacer()
            Image("maker")
                .resizable()
                .frame(
                    width: 220,
                    height: 220,
                    alignment: .center
                )
            Spacer()
            PinkButton(title: "OK", action: {
                isActive = true
            })
            .padding(.bottom, 60)
            
            NavigationLink("", isActive: $isActive) {
                CompleteView()
            }
        }
        .navigationTitle("マーカーを貼ろう")
    }
}

struct MarkerView_Previews: PreviewProvider {
    static var previews: some View {
        MarkerView()
    }
}
