
import SwiftUI



let darkSienna = Color(UIColor(red: 0.13, green: 0.05, blue: 0.06, alpha: 1.00))
let feldGrau = Color(UIColor(red: 0.31, green: 0.42, blue: 0.39, alpha: 1.00))
let middleBlueGreen = Color(UIColor(red: 0.47, green: 0.80, blue: 0.73, alpha: 1.00))


var PrimaryColor = (Color.white)
var SecondaryColor = Color((UIColor.systemGray))
var BackgroundColor = middleBlueGreen

struct ContentView: View {
    @State private var numberof100Bills = 0.0
    @State private var numberof20Bills = 0.0
    @State private var numberof10Bills = 0.0
    @State private var numberof5Bills = 0.0
    @State private var numberof1Bills = 0.0
    @State private var numberofQtrBills = 0.0
    @State private var numberofDimeBills = 0.0
    @State private var numberofNickelBills = 0.0
    @State private var numberofPennyBills = 0.0

    @State private var totalMiscBills = ""
    @State private var totalMiscCoins = ""
    @FocusState private var isInputActive: Bool
    @State private var showSlider = false

    private var miscTotal: Double {
        let temp1 = Double(totalMiscBills) ?? 0
        let temp2 = Double(totalMiscCoins) ?? 0
        return temp1+temp2
    }

    private var hundredTotal: Double {
        return Double(numberof100Bills*100)
    }

    private var twentyTotal: Double {
        return Double(numberof20Bills*20)
    }

    private var tenTotal: Double {
        return Double(numberof10Bills*10)
    }
    private var fiveTotal: Double {
        return Double(numberof5Bills*5)
    }
    private var oneTotal: Double {
        return Double(numberof1Bills*1)
    }

    private var quarterTotal: Double {
        return Double(numberofQtrBills*0.25)
    }

    private var dimeTotal: Double {
        return Double(numberofDimeBills*0.10)
    }

    private var nickelTotal: Double {
        return Double(numberofNickelBills*0.05)
    }

    private var pennyTotal: Double {
        return Double(numberofPennyBills*0.01)
    }


    private var moneyTotal: Double {
        return hundredTotal+twentyTotal+tenTotal+fiveTotal+oneTotal+quarterTotal+dimeTotal+nickelTotal+pennyTotal+miscTotal
    }



    var body: some View {
        ScrollView(.vertical) {




            ZStack {
                Rectangle()
                    .foregroundColor(BackgroundColor)
                    .cornerRadius(20)
                    .edgesIgnoringSafeArea(.all)


                VStack {

                    Toggle(isOn: $showSlider) {
                        Text("Slider")
                    }
                        .padding(5)
                    VStack(spacing:20) {
                        VStack {
                            ScrollView(.horizontal) {
                                HStack(spacing: 10) {
                                    ForEach(histArr, id: \.self) { hist in
                                        if (hist.contains("+")) {
                                            CircleView(label: hist, labelColor: feldGrau)
                                        } else {
                                            CircleView(label: hist, labelColor: feldGrau)
                                        }

                                    }
                                } .padding(15)

                            }
                        }
                        ZStack {

                            Rectangle()
                                .foregroundColor(PrimaryColor)
                                .cornerRadius(20)
                            HStack {
                                HStack {
                                    Text("$")
                                        .foregroundColor(SecondaryColor)
                                        .padding(10)
                                    TextField("Misc. Bills", text: $totalMiscBills)
                                        .padding(10)
                                        .foregroundColor(SecondaryColor)
                                        .keyboardType(.decimalPad)
                                        .focused($isInputActive)

                                        .toolbar {
                                            ToolbarItemGroup( placement: .keyboard) {
                                                Spacer()
                                                Button("Done") {
                                                    isInputActive = false
                                                }
                                            }
                                        }
                                    HStack {
                                        Text("$")
                                            .foregroundColor(SecondaryColor)
                                            .padding(10)
                                        TextField("Misc. Coins", text: $totalMiscCoins)
                                            .foregroundColor(SecondaryColor)
                                            .keyboardType(.decimalPad)
                                            .focused($isInputActive)
                                            .padding(10)
                                            .toolbar {
                                                ToolbarItemGroup( placement: .keyboard) {
                                                    Spacer()

                                                }
                                            }
                                    }
                                }
                            }


                        }

                        HStack(spacing:20) {
                            VStack {
                                BillView(billName: "100$", subtotalAmt: hundredTotal, billQty: numberof100Bills, billQtyBinding: $numberof100Bills)
                                    .frame(width: 100, height: 100)
                                if showSlider {
                                    SliderView(billTypeBinding: $numberof100Bills, qtyAmount: 100)
                                        .frame(width: 100, height: 50)

                                }
                            }
                            VStack{
                                BillView(billName: "20$", subtotalAmt: twentyTotal, billQty: numberof20Bills, billQtyBinding: $numberof20Bills)
                                    .frame(width: 100, height: 100)
                                if showSlider {
                                    SliderView(billTypeBinding: $numberof20Bills, qtyAmount: 200)
                                        .frame(width: 100, height: 50)
                                }
                            }
                            VStack{
                                BillView(billName: "10$", subtotalAmt: tenTotal, billQty: numberof10Bills, billQtyBinding: $numberof10Bills)
                                    .frame(width: 100, height: 100)
                                if showSlider {
                                    SliderView(billTypeBinding: $numberof10Bills, qtyAmount: 200)
                                        .frame(width: 100, height: 50)
                                }
                            }
                        }
                        HStack(spacing:20){
                            VStack{
                                BillView(billName: "5$", subtotalAmt: fiveTotal, billQty: numberof5Bills,  billQtyBinding: $numberof5Bills)
                                    .frame(width: 100, height: 100)
                                if showSlider {
                                    SliderView(billTypeBinding: $numberof5Bills, qtyAmount: 200)
                                        .frame(width: 100, height: 50)
                                }
                            }
                            VStack{
                                BillView(billName: "1$", subtotalAmt: oneTotal, billQty: numberof1Bills,  billQtyBinding: $numberof1Bills)
                                    .frame(width: 100, height: 100)
                                if showSlider {
                                    SliderView(billTypeBinding: $numberof1Bills, qtyAmount: 200)
                                        .frame(width: 100, height: 50)
                                }
                            }
                        }
                        HStack(spacing:20){
                            VStack{
                                BillView(billName: "25c", subtotalAmt: quarterTotal, billQty: numberofQtrBills,  billQtyBinding: $numberofQtrBills)
                                    .frame(width: 100, height: 100)
                                if showSlider {
                                    SliderView(billTypeBinding: $numberofQtrBills, qtyAmount: 500)
                                        .frame(width: 100, height: 50)
                                }
                            }
                            VStack{
                                BillView(billName: "10c", subtotalAmt: dimeTotal, billQty: numberofDimeBills,  billQtyBinding: $numberofDimeBills)
                                    .frame(width: 100, height: 100)
                                if showSlider {
                                    SliderView(billTypeBinding: $numberofDimeBills, qtyAmount: 500)
                                        .frame(width: 100, height: 50)
                                }
                            }
                        }
                        HStack(spacing:20){
                            VStack{
                                BillView(billName: "5c", subtotalAmt: nickelTotal, billQty: numberofNickelBills, billQtyBinding: $numberofNickelBills)
                                    .frame(width: 100, height: 100)
                                if showSlider {
                                    SliderView(billTypeBinding: $numberofNickelBills, qtyAmount: 500)
                                        .frame(width: 100, height: 50)
                                }
                            }
                            VStack{
                                BillView(billName: "1c", subtotalAmt: pennyTotal, billQty: numberofPennyBills, billQtyBinding: $numberofPennyBills)
                                    .frame(width: 100, height: 100)
                                if showSlider {
                                    SliderView(billTypeBinding: $numberofPennyBills, qtyAmount: 500)
                                        .frame(width: 100, height: 50)
                                }
                            }
                        }
                     
                        Button {
                            numberof100Bills = 0.0
                            numberof20Bills = 0.0
                            numberof10Bills = 0.0
                            numberof5Bills = 0.0
                            numberof1Bills = 0.0
                            numberofQtrBills = 0.0
                            numberofDimeBills = 0.0
                            numberofNickelBills = 0.0
                            numberofPennyBills = 0.0
                            totalMiscBills = ""
                            totalMiscCoins = ""
                            histArr = [String]()
                        } label: {
                            ZStack {
                                Rectangle()
                                    .cornerRadius(20)
                                    .foregroundColor(PrimaryColor)

                                Text("CLEAR")
                                    .foregroundColor(SecondaryColor)
                                    .padding(10)
                            }

                        }


                        TotalView(moneyMoneyMoney: moneyTotal)
            
                        HStack{
                            SaveView(currTotal: moneyTotal)
                            VStack{
                                ScrollView(.horizontal) {
                                    HStack(spacing: 10) {
                                        ForEach(savedArr, id: \.self) { saved in
                                            CircleView(label: saved, labelColor: SecondaryColor)
                                        }
                                    }

                                } .padding(30)
                            }
                        }

                    }
                }

            }

        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}

