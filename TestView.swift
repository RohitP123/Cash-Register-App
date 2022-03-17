//
//  TestView.swift
//  Cash-Register-App
//
//  Created by 90308209 on 3/16/22.
//

import SwiftUI
struct TestView: View {
    @State private var counter: Int = 0
    @State private var timer: Timer?
    @State var isLongPressing = false

    var body: some View {
        VStack {
            Text("\(counter)")
                .font(.largeTitle)
                .fontWeight(.heavy)

            Button(action: {
                print("tap")
                if(self.isLongPressing){
                    //this tap was caused by the end of a longpress gesture, so stop our fastforwarding
                    self.isLongPressing.toggle()
                    self.timer?.invalidate()

                } else {
                    //just a regular tap
                    self.counter += 1

                }
            }, label: {
                Image(systemName: self.isLongPressing ? "chevron.right.2": "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)

            })
            .simultaneousGesture(LongPressGesture(minimumDuration: 0.2).onEnded { _ in
                print("long press")
                self.isLongPressing = true
                //or fastforward has started to start the timer
                self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
                    self.counter += 1
                })
            })
        }
    }
}
