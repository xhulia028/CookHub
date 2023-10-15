
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            EndlessRecpieView()
            .tabItem {
                Label("Recipes", systemImage: "list.dash")
            }
            
            LikedRecipesView()
                .tabItem {
                    Label("Liked Recipes", systemImage: "heart")
                }
            
            LocalRecipesView()
                .tabItem {
                    Label("My Recipes", systemImage: "tray")
                }
        }

    }
}

#Preview {
    ContentView()
}
