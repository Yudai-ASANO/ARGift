//
//  MessageView.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/30.
//

import SwiftUI

struct MessageView: View {
    @State private var text: String = ""
    @State private var isActive: Bool = false
    @FocusState private var focus: Bool
    
    var body: some View {
        ScrollView {
            LazyVStack {
                NavigationLink("", isActive: $isActive) {
                    FinishView()
                }
                TextEditor(text: $text)
                    .font(.system(size: 24))
                    .frame(width: 324, height: 400, alignment: .center)
                    .border(Color("#darkMaroon"), width: 1)
                    .focused($focus)
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                if value.translation.height != 0 {
                                    self.focus = false
                                }
                            })
                    )
                
                OrangeButton(title: "OK") {
                    isActive = true
                }
                .padding()
            }
            .padding(.top, 40)
        }
        .navigationTitle("メッセージを入力")
        .navigationBarHidden(false)
    }
}

//struct MessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageView()
//    }
//}
