var savedArr = [String]()
var emptyArr = [String]()

import SwiftUI

struct SaveView: View {

    var currTotal = 0.0

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(PrimaryColor)
                .cornerRadius(20)
                .frame(width: screenSize.width/2, height: screenSize.height/10)

            
            VStack{
           
                HStack {
                Button {

                    let totalToString: String = String(format: "%.2f", currTotal)
                    savedArr.append(totalToString)

                } label: {
                    ZStack {
                        Rectangle()
                            .cornerRadius(20)
                            .foregroundColor(PrimaryColor)
                            .frame(width: screenSize.width/2, height: screenSize.height/25)
                        
                        Text("Save Value")
                            .foregroundColor(SecondaryColor)
                            .padding(10)
                    }
                }
                
            }

                Button {
                    savedArr = [String]()
                } label: {
                    ZStack {
                        Rectangle()
                            .cornerRadius(20)
                            .foregroundColor(PrimaryColor)
                            .frame(width: screenSize.width/2, height: screenSize.height/25)
                        
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
