import SwiftUI

struct LoaderView: View {
    let isFailed: Bool
    var body: some View {
        Text(isFailed ? "Failed. Tap to retry." : "Loading..")
            .foregroundColor(isFailed ? .red : .secondary)
            .padding()
    }
}

#Preview {
    LoaderView(isFailed: false)
}
