import SwiftUI

struct TotalView: View {
    var moneyMoneyMoney = 0.0
    let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)

    var body: some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(PrimaryColor)
                .cornerRadius(15)
                .frame(width: screenSize.width/2, height: screenSize.height/10)

            Spacer()
            VStack {


                Text("Total: $\(moneyMoneyMoney, specifier: "%.2f")")
                    .foregroundColor(SecondaryColor)
                    .padding(10)
            }
        }
    }
}

struct TotalView_Previews: PreviewProvider {
    static var previews: some View {
        TotalView()
    }
}
