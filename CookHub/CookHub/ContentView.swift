
import SwiftUI

struct ContentView: View {

    @Environment(MainModel.self) private var model
    var body: some View {
        TabView{
            EndlessRecpieView()
                .environment(model)
                .tabItem {
                    Label("Recipes", systemImage: "list.dash")
                }
            
            LikedRecipesView()
                .environment(model)
                .tabItem {
                    Label("Liked Recipes", systemImage: "heart")
                }
            
            LocalRecipesView()
                .environment(model)
                .tabItem {
                    Label("My Recipes", systemImage: "tray")
                }
        }
        
    }
}

