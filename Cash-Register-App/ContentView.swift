
import SwiftUI



let darkSienna = Color(UIColor(red: 0.13, green: 0.05, blue: 0.06, alpha: 1.00))
let feldGrau = Color(UIColor(red: 0.31, green: 0.42, blue: 0.39, alpha: 1.00))
let middleBlueGreen = Color(UIColor(red: 0.47, green: 0.80, blue: 0.73, alpha: 1.00))
let lighterFeldGRau = Color(UIColor(red: 0.31, green: 0.42, blue: 0.39, alpha: 0.50))

var PrimaryColor = (Color.white)
var SecondaryColor = Color((UIColor.black))
var BackgroundColor = middleBlueGreen

let screenSize: CGRect = UIScreen.main.bounds

struct ContentView: View {
    @State private var num100Bills = 0.0
    @State private var num20Bills = 0.0
    @State private var num10Bills = 0.0
    @State private var num5Bills = 0.0
    @State private var num1Bills = 0.0
    @State private var numQuarters = 0.0
    @State private var numDimes = 0.0
    @State private var numNickels = 0.0
    @State private var numPennys = 0.0
    @State private var numQuarterRolls = 0.0
    @State private var numDimeRolls = 0.0
    @State private var numNickelRolls = 0.0
    @State private var numPennyRolls = 0.0

    @State private var totalMiscBills = ""
    @State private var totalMiscCoins = ""
    @FocusState private var isInputActive: Bool
    @State private var showSlider = false
    @State private var showCoinRolls = false
    
    private var miscTotal: Double {
        let temp1 = Double(totalMiscBills) ?? 0
        let temp2 = Double(totalMiscCoins) ?? 0
        return temp1+temp2
        
    }

    
    private var hundredTotal: Double {
        return Double(num100Bills*100)
    }
    
    private var twentyTotal: Double {
        return Double(num20Bills*20)
    }
    
    private var tenTotal: Double {
        return Double(num10Bills*10)
    }
    private var fiveTotal: Double {
        return Double(num5Bills*5)
    }
    private var oneTotal: Double {
        return Double(num1Bills*1)
    }
    
    private var quarterTotal: Double {
        return Double(numQuarters*0.25)
    }
    
    private var dimeTotal: Double {
        return Double(numDimes*0.10)
    }
    
    private var nickelTotal: Double {
        return Double(numNickels*0.05)
    }
    
    private var pennyTotal: Double {
        return Double(numPennys*0.01)
    }

    private var quarterRollTotal: Double {
        return Double(numQuarterRolls*0.25*40)
    }

    private var dimeRollTotal: Double {
        return Double(numDimeRolls*0.10*50)
    }

    private var nickelRollTotal: Double {
        return Double(numNickelRolls*0.05*40)
    }

    private var pennyRollTotal: Double {
        return Double(numPennyRolls*0.01*50)
    }
    

    private var moneyTotal: Double {
        return hundredTotal+twentyTotal+tenTotal+fiveTotal+oneTotal+quarterTotal+dimeTotal+nickelTotal+pennyTotal+miscTotal+quarterRollTotal+dimeRollTotal+nickelRollTotal+pennyRollTotal
    }

    
    
    
    var body: some View {
        ScrollView(.vertical) {
            
            
            
            
            ZStack {
                Rectangle()
                    .foregroundColor(BackgroundColor)
                    .cornerRadius(20)
                    .edgesIgnoringSafeArea(.all)
                    //.scaledToFit()
                    .frame(width: screenSize.width , height: screenSize.height)
                
                
                VStack {
                    VStack(spacing:20) {
                        VStack {
                            ScrollView(.horizontal) {
                                HStack(spacing: 10) {
                                    ForEach(histArr, id: \.self) { hist in
                                        if (hist.contains("+")) {
                                            CircleView(label: hist, labelColor: lighterFeldGRau)
                                        } else {
                                            CircleView(label: hist, labelColor: feldGrau)
                                        }
                                    }
                                }.padding(15)
                                
                            }

                            Toggle(isOn: $showSlider) {
                                Spacer()
                                Text("Toggle Sliders")
                                    .foregroundColor(feldGrau)
                            }

                            Toggle(isOn: $showCoinRolls) {
                                Spacer()
                                Text("Toggle Coin Rolls")
                                    .foregroundColor(feldGrau)
                            }
                        }

                        ZStack {
                            
                            Rectangle()
                                .foregroundColor(PrimaryColor)
                                .cornerRadius(20)
                                .frame(width: screenSize.width, height: screenSize.height/10)
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
                                    
                                    Rectangle()
                                        .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                                        .frame(width: 1, height: 20)

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
                                BillView(billName: "$100", subtotalAmt: hundredTotal, billQty: num100Bills, billQtyBinding: $num100Bills)
                                    .frame(width: 100, height: 100)
                                if showSlider {
                                    SliderView(billTypeBinding: $num100Bills, qtyAmount: 50)
                                        .frame(width: 100, height: 50)
                                    
                                }
                            }
                            VStack{
                                BillView(billName: "$20", subtotalAmt: twentyTotal, billQty: num20Bills, billQtyBinding: $num20Bills)
                                    .frame(width: 100, height: 100)
                                if showSlider {
                                    SliderView(billTypeBinding: $num20Bills, qtyAmount: 50)
                                        .frame(width: 100, height: 50)
                                }
                            }
                            VStack{
                                BillView(billName: "$10", subtotalAmt: tenTotal, billQty: num10Bills, billQtyBinding: $num10Bills)
                                    .frame(width: 100, height: 100)
                                if showSlider {
                                    SliderView(billTypeBinding: $num10Bills, qtyAmount: 50)
                                        .frame(width: 100, height: 50)
                                }
                            }
                        }
                        HStack(spacing:20){
                            VStack{
                                BillView(billName: "$5", subtotalAmt: fiveTotal, billQty: num5Bills,  billQtyBinding: $num5Bills)
                                    .frame(width: 100, height: 100)
                                if showSlider {
                                    SliderView(billTypeBinding: $num5Bills, qtyAmount: 50)
                                        .frame(width: 100, height: 50)
                                }
                            }
                            VStack{
                                BillView(billName: "$1", subtotalAmt: oneTotal, billQty: num1Bills,  billQtyBinding: $num1Bills)
                                    .frame(width: 100, height: 100)
                                //.padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                                if showSlider {
                                    SliderView(billTypeBinding: $num1Bills, qtyAmount: 50)
                                        .frame(width: 100, height: 50)
                                }
                            }
                        }

                        Rectangle()
                            .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                            .frame(width: 300, height: 1)

                        HStack(spacing:20){
                            if (showCoinRolls) {
                                VStack{
                                    BillView(billName: "25c R", subtotalAmt: quarterRollTotal, billQty: numQuarterRolls,  billQtyBinding: $numQuarterRolls)
                                        .frame(width: 100, height: 100)
                                    if showSlider {
                                        SliderView(billTypeBinding: $numQuarterRolls, qtyAmount: 50)
                                            .frame(width: 100, height: 50)
                                    }
                                }
                                VStack{
                                    BillView(billName: "10c R", subtotalAmt: dimeRollTotal, billQty: numDimeRolls,  billQtyBinding: $numDimeRolls)
                                        .frame(width: 100, height: 100)
                                    //.padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                                    if showSlider {
                                        SliderView(billTypeBinding: $numDimeRolls, qtyAmount: 50)
                                            .frame(width: 100, height: 50)
                                    }
                                }
                            } else {
                                VStack{
                                    BillView(billName: "25c", subtotalAmt: quarterTotal, billQty: numQuarters,  billQtyBinding: $numQuarters)
                                        .frame(width: 100, height: 100)
                                    if showSlider {
                                        SliderView(billTypeBinding: $numQuarters, qtyAmount: 50)
                                            .frame(width: 100, height: 50)
                                    }
                                }
                                VStack{
                                    BillView(billName: "10c", subtotalAmt: dimeTotal, billQty: numDimes,  billQtyBinding: $numDimes)
                                        .frame(width: 100, height: 100)
                                    //.padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
                                    if showSlider {
                                        SliderView(billTypeBinding: $numDimes, qtyAmount: 50)
                                            .frame(width: 100, height: 50)
                                    }
                                }
                            }





                        }
                        HStack(spacing:20){
                            if showCoinRolls {
                                VStack{
                                    BillView(billName: "5c R", subtotalAmt: nickelRollTotal, billQty: numNickelRolls, billQtyBinding: $numNickelRolls)
                                        .frame(width: 100, height: 100)
                                    if showSlider {
                                        SliderView(billTypeBinding: $numNickelRolls, qtyAmount: 50)
                                            .frame(width: 100, height: 50)
                                    }
                                }
                                VStack{
                                    BillView(billName: "1c R", subtotalAmt: pennyRollTotal, billQty: numPennyRolls, billQtyBinding: $numPennyRolls)
                                        .frame(width: 100, height: 100)
                                    if showSlider {
                                        SliderView(billTypeBinding: $numPennyRolls, qtyAmount: 50)
                                            .frame(width: 100, height: 50)
                                    }
                                }
                            } else {
                                VStack{
                                    BillView(billName: "5c", subtotalAmt: nickelTotal, billQty: numNickels, billQtyBinding: $numNickels)
                                        .frame(width: 100, height: 100)
                                    if showSlider {
                                        SliderView(billTypeBinding: $numNickels, qtyAmount: 50)
                                            .frame(width: 100, height: 50)
                                    }
                                }
                                VStack{
                                    BillView(billName: "1c", subtotalAmt: pennyTotal, billQty: numPennys, billQtyBinding: $numPennys)
                                        .frame(width: 100, height: 100)
                                    if showSlider {
                                        SliderView(billTypeBinding: $numPennys, qtyAmount: 50)
                                            .frame(width: 100, height: 50)
                                    }
                                }
                            }


                        }
                        HStack{
                        Button {
                            num100Bills = 0.0
                            num20Bills = 0.0
                            num10Bills = 0.0
                            num5Bills = 0.0
                            num1Bills = 0.0
                            numQuarters = 0.0
                            numDimes = 0.0
                            numNickels = 0.0
                            numPennys = 0.0
                            numQuarterRolls = 0.0
                            numDimeRolls = 0.0
                            numNickelRolls = 0.0
                            numPennyRolls = 0.0
                            totalMiscBills = ""
                            totalMiscCoins = ""
                            histArr = [String]()
                        } label: {
                            ZStack {
                                Rectangle()
                                    .cornerRadius(20)
                                    .foregroundColor(PrimaryColor)
                                    .frame(width: screenSize.width/2, height: screenSize.height/10)
                                
                                Text("Clear")
                                    .foregroundColor(SecondaryColor)
                                    .padding(10)
                                
                            }
                            
                        }
                        
                        
                        TotalView(moneyMoneyMoney: moneyTotal)
                        }
                        HStack{
                            SaveView(currTotal: moneyTotal)
                            VStack{
                                ScrollView(.horizontal) {
                                    HStack(spacing: 10) {
                                        ForEach(savedArr, id: \.self) { saved in
                                            CircleView(label: "$" + saved, labelColor: feldGrau)
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

