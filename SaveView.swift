var savedArr = [String]()

import SwiftUI

struct SaveView: View {

    var currTotal = 0.0

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(PrimaryColor)
                .cornerRadius(15)
            HStack {
                Button {

                    let totalToString: String = String(format: "%.2f", currTotal)
                    savedArr.append(totalToString)

                } label: {
                    Text("Save Value")
                        .foregroundColor(feldGrau)
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
