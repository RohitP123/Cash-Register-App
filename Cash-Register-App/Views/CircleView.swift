import SwiftUI


struct CircleView: View {
    @State var label: String
    var labelColor : Color

    var body: some View {

        ZStack {
            Circle()
                .fill(labelColor)
                .frame(width: 55, height: 55)
            Text(label)
        }
    }
}


struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(label: "blank", labelColor: Color.yellow)
    }
}

