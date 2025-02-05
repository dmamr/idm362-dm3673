//
//  mainView.swift
//  idm362-dm3673
//
//  Created by Dariya Mamratova on 2/4/25.
//

import SwiftUI

// create a data model
class UserData: ObservableObject {
    @Published var ndx: Int = 0
}

struct mainView: View {
    @StateObject var userData = UserData()
    
    var body: some View {
        TabView {
            // Home Tab
            ContentView()
                .tabItem {
                    Text("Home")
                    Label("Home", systemImage: "house.fill")
                }
            
            // About Tab
            Text("User Picked \(userData.ndx)")
                .tabItem {
                    Label("About", systemImage: "info.circle.fill")
                }
            
            // Settings Tab
            Text("Well, nothing new. In the settings tab you still see that the user picked \(userData.ndx)")
                .padding()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        } // end tab view
        .tint(Color("colorWeatherBG"))
        .environmentObject(userData)
    } //end body
}

#Preview {
    mainView()
    // make userdata available
        .environmentObject(UserData())
}
