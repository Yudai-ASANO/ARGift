//
//  PinkButtonSmall.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/26.
//

import SwiftUI

struct PinkButtonSmall: View {
    var title: String
    var disabled: Bool = false
    var action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                LinearGradient(
                    gradient: Gradient(
                        colors: [Color("#salmonPink"),
                                 Color("#warmPink"),
                                 Color("#apricot")]
                    ),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                Text(title)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
            }
            .frame(width: 146, height: 40, alignment: .center)
            .cornerRadius(9)
        }
        .disabled(disabled)
        .buttonStyle(PinkButtonStyle(disabled: disabled))
    }
}

//struct PinkButtonSmall_Previews: PreviewProvider {
//    static var previews: some View {
//        PinkButtonSmall()
//    }
//}
