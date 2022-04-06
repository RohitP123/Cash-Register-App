import SwiftUI

var histArr = [String]()

struct BillView: View {
    var billName = "" //"20$"
    var subtotalAmt = 1.01
    var billQty = 1.0
    var billFlag = false


    @State private var timer: Timer?
    @State var isLongPressing = false
    @State var isLongPressingMinus = false
    //shoutout https://adampaxton.com/make-a-press-and-hold-fast-forward-button-in-swiftui/

    @Binding var billQtyBinding: Double //x
    @State var showAbove = false;
    var body: some View {
        VStack{
            if(showAbove) {
                if (billName.suffix(1) == "c") {
                Text("$\(subtotalAmt, specifier: "%.2f")")
                    .foregroundColor(SecondaryColor)
                    .font(.subheadline)
                    .fontWeight(.regular)
                }
                else {
                    Text("$\(subtotalAmt, specifier: "%.0f")")
                        .foregroundColor(SecondaryColor)
                        .font(.subheadline)
                        .fontWeight(.regular)
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(PrimaryColor)
                    .cornerRadius(15)
                    .frame(width: 100, height: 60)
                Spacer()
                Button(action: {
                    if(self.isLongPressing){
                        //end of a longpress gesture, stop fastforwarding
                        self.isLongPressing.toggle()
                        self.showAbove = false;
                        self.timer?.invalidate()
                    } else {
                        //regular tap
                        self.billQtyBinding += 1
                        histArr.append("+"+billName)
                    }
                }, label: {
                    Text(billName)
                        .foregroundColor(SecondaryColor)
                        .font(.subheadline)
                        .fontWeight(.regular) // $20

                    Rectangle()
                        .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                        .frame(width: 1, height: 20) // |

                    let intBillQty = (Int)(billQty)
                    Text("\(intBillQty)")
                        .foregroundColor(SecondaryColor)
                        .font(.subheadline)
                        .fontWeight(.regular) // 3

                })
                .simultaneousGesture(LongPressGesture(minimumDuration: 0.2).onEnded { _ in
                    self.isLongPressing = true
                    self.showAbove = true;
                    //or fastforward has started to start the timer
                    self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
                        self.billQtyBinding += 1
                        histArr.append("+"+billName)
                    })
                })


            }

            Spacer()
            HStack{

                Button(action: {
                    if(self.isLongPressingMinus){
                        //end of a longpress gesture, stop fastforwarding
                        self.isLongPressingMinus.toggle()
                        self.timer?.invalidate()
                    } else {
                        //regular tap
                        if billQtyBinding > 0 {
                            self.billQtyBinding -= 1
                            histArr.append("-"+billName)
                        }
                    }
                }, label: {
                    HStack{
                        if (billQtyBinding > 0) {
                            Image(systemName: "minus.circle")
                                .foregroundColor(.red)
                                .font(.system(.title, design:
                                        .rounded))
                            if (billName.suffix(1) == "c") {
                            Text("$\(subtotalAmt, specifier: "%.2f")")
                                .foregroundColor(SecondaryColor)
                                .font(.subheadline)
                                .fontWeight(.regular)
                            }
                            else {
                                Text("$\(subtotalAmt, specifier: "%.0f")")
                                    .foregroundColor(SecondaryColor)
                                    .font(.subheadline)
                                    .fontWeight(.regular)
                            }
                        } else {
                            Text("$\(subtotalAmt, specifier: "%.2f")")
                                .foregroundColor(SecondaryColor)
                                .font(.subheadline)
                                .fontWeight(.regular)
                        }
                    }
                })

                .simultaneousGesture(LongPressGesture(minimumDuration: 0.2).onEnded { _ in
                    self.isLongPressingMinus = true
                    //or fastforward has started to start the timer
                    self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
                        if billQtyBinding > 0 {
                        self.billQtyBinding -= 1
                        histArr.append("-"+billName)
                        }
                    })
                })
            }
        }
    }

}

struct BillView_Previews: PreviewProvider {
    static var previews: some View {
        BillView(billName: "Blank", billFlag : false, billQtyBinding: .constant(1))
    }
}
