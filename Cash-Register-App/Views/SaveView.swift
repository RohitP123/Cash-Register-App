var savedArr = [String]()
var emptyArr = [String]()

import SwiftUI

struct SaveView: View {

    var currTotal = 0.0

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(PrimaryColor)
                .cornerRadius(15)
            VStack{
           
                HStack {
                Button {

                    let totalToString: String = String(format: "%.2f", currTotal)
                    savedArr.append(totalToString)

                } label: {
                    Text("Save Value")
                        .foregroundColor(SecondaryColor)
                }
                
            }

                Button {
                    savedArr = [String]()
                } label: {
                    ZStack {
                        Rectangle()
                            .cornerRadius(20)
                            .foregroundColor(PrimaryColor)
                        
                        Text("Clear Saved")
                            .foregroundColor(SecondaryColor)
                            .padding(10)
                    }
                }

            }
        }
    }
}

struct SaveView_Previews: PreviewProvider {
    static var previews: some View {
        SaveView()
    }
}
