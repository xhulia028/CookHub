
import SwiftUI

struct IngredientView: View {
    @Binding var ingredient: String
    @Binding var amount: String
    var onDelete: () -> Void
    
    var body: some View {
        HStack{
            
            TextField("Ingredient", text: $ingredient)
                .multilineTextAlignment(.center)
            Rectangle()
                .fill(Color.secondary)
                .frame(width: 1.5)
                .opacity(0.5)
            
            
            TextField("Amount", text: $amount)
                .multilineTextAlignment(.center)
            
            Button (action: onDelete) {
                Image(systemName: "trash")
            }
            
        }
    }
}


