import SwiftUI

var histArr = [String]()

struct BillView: View {
    var billName = "" //"20$"
    var subtotalAmt = 1.01
    var billQty = 1.0


    @Binding var billQtyBinding: Double //x

    var body: some View {
        VStack {

            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(PrimaryColor)
                    .cornerRadius(15)
                Spacer()
                HStack {
                    Button {
                        billQtyBinding += 1
                        histArr.append("+"+billName)
                    } label: {
                        Text(billName)
                            .foregroundColor(SecondaryColor)
                            .font(.subheadline)
                            .fontWeight(.regular)

                       Rectangle()
                           .foregroundColor(Color(red: 128/255, green: 128/255, blue: 128/255))
                           .frame(width: 1, height: 20)
                        
                        let intBillQty = (Int)(billQty)
                        Text("\(intBillQty)")
                            .foregroundColor(SecondaryColor)
                            .font(.subheadline)
                            .fontWeight(.regular)

                    }

                }

            }
            Spacer()
            HStack{
            Button {
                if billQtyBinding > 0 {
                    billQtyBinding -= 1
                    histArr.append("-"+billName)
                }
            } label: {
                /*

                 */
                Image(systemName: "minus.circle")
                    .foregroundColor(.red)
                    .font(.system(.title, design:
                                        .rounded))
            }
                Text("$\(subtotalAmt, specifier: "%.2f")")
                    .foregroundColor(SecondaryColor)
                    .font(.subheadline)
                    .fontWeight(.regular)
            }
        }
    }
}

struct BillView_Previews: PreviewProvider {
    static var previews: some View {
        BillView(billName: "Blank", billQtyBinding: .constant(1))
    }
}
