//
//  InstructionsView.swift
//  CookHub
//
//  Created by Xhulia Uni on 17.10.23.
//

import SwiftUI

struct InstructionsView: View {
    var getStrInstructions: String
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                CustomTextView( text: "Instructions:")
                    .font(.title3)
                    .bold()
                    .padding(.vertical, 5)

                CustomTextView( text: getStrInstructions)
                    .font(.body)
            } .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .padding()
        }.background(.ultraThinMaterial)
        .cornerRadius(15)
        .padding()
    }
}

 #Preview {
     InstructionsView(getStrInstructions: "random instructions")
 }
