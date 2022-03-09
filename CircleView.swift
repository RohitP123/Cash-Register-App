import SwiftUI


struct CircleView: View {
    @State var label: String
    var labelColor : Color


    var body: some View {

        ZStack {
            Circle()
                .fill(labelColor)
                .frame(width: 50, height: 50)
            Text(label)
        }
    }
}


struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(label: "blank", labelColor: Color.yellow)
    }
}

