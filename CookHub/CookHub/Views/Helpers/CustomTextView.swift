
import SwiftUI

struct CustomTextView: View {
    @State var text: String
    var body: some View {
        Text(text)
            .font(Font.custom("Trebuchet MS", size: 18))
    }
}

