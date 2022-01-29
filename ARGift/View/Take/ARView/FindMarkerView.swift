//
//  FindMarkerView.swift
//  ARGift
//
//  Created by yudai asano on 2022/01/30.
//

import SwiftUI

struct FindMarkerView: View {
    var index: Int
    @ObservedObject var store: TakeMarkerStore
    @State private var isActive: Bool = false
    var body: some View {
        ZStack(alignment: .top) {
            ARContentsViewContainer(attribute: .init(order: index, resource: store.data[index].imageResource, objectUrl: store.data[index].usdzUrl))
            HStack {
                Image(store.data[index].imageUrl)
                    .resizable()
                    .frame(width: 110, height: 110, alignment: .center)
                    .cornerRadius(7)
                    .padding(.top, 60)
                    .padding(.leading, 20)
                Spacer()
            }
            
            VStack {
                NavigationLink("", isActive: $isActive) {
                    if index > 1 {
                        MessageView()
                    } else {
                        FindMarkerView(index: index + 1, store: store)
                    }
                }
                Spacer()
                OrangeButton(title: index > 1 ? "Present!" : "Next") {
                    isActive = true
                }
                .padding(60)
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

//struct FindMarkerView_Previews: PreviewProvider {
//    static var previews: some View {
//        FindMarkerView()
//    }
//}
