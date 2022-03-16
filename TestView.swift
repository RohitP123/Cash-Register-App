//
//  TestView.swift
//  Cash-Register-App
//
//  Created by 90308209 on 3/16/22.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        Button(action: {

        }) {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .simultaneousGesture(LongPressGesture().onEnded { _ in
            print("Secret Long Press Action!")
        })
        .simultaneousGesture(TapGesture().onEnded {
            print("Boring regular tap")

        })
        Spacer()

    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
