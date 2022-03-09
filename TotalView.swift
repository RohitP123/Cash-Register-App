import SwiftUI

struct TotalView: View {
    var moneyMoneyMoney = 0.0
    let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(PrimaryColor)
                .cornerRadius(15)

            Spacer()
            VStack {


                Text("Total Money in Register: $\(moneyMoneyMoney, specifier: "%.2f")")
                    .foregroundColor(SecondaryColor)
                    .padding(10)
            }
        }
        Spacer()
    }
}

struct TotalView_Previews: PreviewProvider {
    static var previews: some View {
        TotalView()
    }
}