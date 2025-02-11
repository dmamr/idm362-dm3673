import SwiftUI

struct MainView: View {
    @Environment(\.colorScheme) var colorScheme
    
    // computed properties for theme colors
    var backgroundColor: Color {
        colorScheme == .dark ?
            Color(red: 59/255, green: 44/255, blue: 57/255) :
            Color(red: 246/255, green: 239/255, blue: 233/255)
    }
    var textColor: Color {
        colorScheme == .dark ?
            Color(red: 243/255, green: 217/255, blue: 237/255) :
            Color(red: 59/255, green: 44/255, blue: 57/255)
    }
    var accentColor: Color {
        Color(red: 195/255, green: 165/255, blue: 193/255)
    }
    
    var body: some View {
        TabView {
            // First tab: To-Do
            ContentView()
                .tabItem {
                    Label("to do", systemImage: "checkmark.circle")
                }
            
            // Second tab: Instructions
            InstructionsView()
                .tabItem {
                    Label("instructions", systemImage: "info.circle")
                }
        }
        .accentColor(accentColor)
        .background(backgroundColor.edgesIgnoringSafeArea(.all))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
