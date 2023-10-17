//
//  IngredientsView.swift
//  CookHub
//
//  Created by Xhulia Uni on 17.10.23.
//

import SwiftUI

struct IngredientsView: View {
    var ingredients: [String]
    var measurements: [String]
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                CustomTextView( text: "Ingredients:")
                    .font(.title3)
                    .bold()
                    .padding(.vertical, 5)

                ForEach(0..<ingredients.count, id: \.self) { index in
                    if !ingredients[index].isEmpty {
                        CustomTextView( text: "\(ingredients[index]) -  \(measurements[index])")
                            .font(.body)
                    }
                }
            } .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }.background(.ultraThinMaterial)
        .cornerRadius(15)
        .padding()
    }
}
