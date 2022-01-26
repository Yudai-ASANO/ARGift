//
//  Markerlmage.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/23.
//

import SwiftUI

struct Markerlmage: View {
    var imageUrl: String
    var width: CGFloat = 150
    var disabled: Bool = false
    @Binding var isSelected: Bool
    
    var body: some View {
        Button {
            isSelected.toggle()
        } label: {
            ZStack(alignment: .topTrailing) {
                Image(imageUrl)
                    .resizable()
                    .frame(width: width, height: width, alignment: .center)
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                }
            }
            .cornerRadius(9)
            .shadow(
                color: Color("#greyishBrown").opacity(0.50),
                radius: 5,
                x: 0,
                y: 0
            )
        }
        .disabled(disabled)
    }
}

//struct Markerlmage_Previews: PreviewProvider {
//    static var previews: some View {
//        Markerlmage()
//    }
//}
