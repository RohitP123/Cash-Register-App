
import SwiftUI

struct SliderView: View {


    @Binding var billTypeBinding: Double
    @State var isEditing = false


    var body: some View {


        Slider(
            value: $billTypeBinding,
            in: 0...100,
            step: 1
        ) {
            Text("Qty")
        } minimumValueLabel: {
            Text("0")
        } maximumValueLabel: {
            Text("100")
        } onEditingChanged: { editing in
            isEditing = editing
        }



    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(billTypeBinding: .constant(1))
    }
}


