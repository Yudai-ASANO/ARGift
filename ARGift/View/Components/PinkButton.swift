//
//  PinkButton.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/26.
//

import SwiftUI

struct PinkButton: View {
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
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .frame(width: 220, height: 60, alignment: .center)
            .cornerRadius(9)
        }
        .disabled(disabled)
        .buttonStyle(PinkButtonStyle(disabled: disabled))
    }
}

struct PinkButtonStyle: ButtonStyle {
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

struct PinkButton_Previews: PreviewProvider {
    static var previews: some View {
        PinkButton(title: "OK") {
            // action
        }
    }
}
