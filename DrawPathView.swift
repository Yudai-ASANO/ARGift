//
//  DrawPathView.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/24.
//

import SwiftUI

struct DrawPathView: View {
    var drawPointsArray: [DrawPoints]
    var body: some View {
        ZStack {
            ForEach(drawPointsArray) { data in
                Path { path in
                    path.addLines(data.points)
                }
                .stroke(data.color, lineWidth: 10)
            }
        }
    }
}

//struct DrawPathView_Previews: PreviewProvider {
//    static var previews: some View {
//        DrawPathView()
//    }
//}
