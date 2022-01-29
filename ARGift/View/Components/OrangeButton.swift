//
//  OrangeButton.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/26.
//

import SwiftUI

import SwiftUI

struct OrangeButton: View {
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
                        colors: [Color("#salmon"),
                                 Color("#apricot"),
                                 Color("#warmPink")]
                    ),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                Text(title)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .frame(width: 220, height: 60, alignment: .center)
            .cornerRadius(9)
        }
        .disabled(disabled)
        .buttonStyle(OrangeButtonStyle(disabled: disabled))
    }
}

struct OrangeButtonStyle: ButtonStyle {
    var disabled: Bool
    func makeBody(configuration: Configuration) -> some View {
        if disabled {
            configuration.label
                .opacity(0.4)
        } else {
            configuration.label
                .opacity(configuration.isPressed ? 0.6 : 1.0)
                .shadow(
                    color: Color("#greishBrown").opacity(0.75),
                    radius: 6,
                    x: 0,
                    y: 0
                )
        }
    }
}


struct OrangeButton_Previews: PreviewProvider {
    static var previews: some View {
        OrangeButton(title: "OK") {
            // code
        }
    }
}
