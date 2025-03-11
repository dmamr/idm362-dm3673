import SwiftUI

struct MainView: View {
    @Environment(\.colorScheme) var colorScheme
    
    // using asset catalog colors
    var backgroundColor: Color {
        Color("BackgroundColor")
    }
    var textColor: Color {
        Color("TextColor")
    }
    var accentColor: Color {
        Color("AccentColor")
    }
 
    var body: some View {
        TabView {
            // First tab: To-Do
            ContentView()
                .tabItem {
                    Image(systemName: "checkmark.circle")
                    Text("to do")
                }
            
            // Second tab: Instructions
            InstructionsView()
                .tabItem {
                    Label("instructions", systemImage: "info.circle")
                }
        }
        .background(backgroundColor.edgesIgnoringSafeArea(.all))
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
