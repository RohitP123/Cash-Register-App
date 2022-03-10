
import SwiftUI

struct SliderView: View {


    @Binding var billTypeBinding: Double
    @State var isEditing = false
    @State var qtyAmount = 0.0


    var body: some View {


        Slider(
             value: $billTypeBinding,
             in: 0...qtyAmount,
             step: 1
         ) {
             Text("Qty")
         } minimumValueLabel: {
             Text("0")
         } maximumValueLabel: {
             Text("\(qtyAmount, specifier: "%.0f")")
         } onEditingChanged: { editing in
             isEditing = editing
         }


    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(billTypeBinding: .constant(1), qtyAmount: 0)
        .padding()
    }
}


