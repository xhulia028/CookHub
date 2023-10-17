import SwiftUI

@main

struct CookHubApp: App {
    @State var model: MainModel = MainModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(model)
                .task {
                    await model.fetchRecipes()
                }
        }
    }
}
