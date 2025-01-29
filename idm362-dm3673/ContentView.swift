//
//  ContentView.swift
//  idm362-dm3673
//
//  Created by Dariya Mamratova on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    // get color scheme from device
    @Environment(\.colorScheme) var colorScheme
    @State private var userPicked = 0

    
    var body: some View {
        ZStack() {
            LinearGradient(gradient: Gradient(colors: [
                colorScheme == .dark ? .black : .purple,
                colorScheme == .dark ? .gray : .orange]),
                startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("ChecknGlow")
                    .font(.custom("Futura-Bold", fixedSize: 35))
                    .foregroundColor(colorScheme == .dark ? .purple : .white)
                    .padding()
                VStack {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame (width: 130, height: 130)
                    Text("27ºC")
                        .font(.custom("Futura Medium Italic", fixedSize: 60))
                        .foregroundColor(colorScheme == .dark ? .purple : .white)
                        .padding()
                }
                Image(systemName: "figure.hiking.circle.fill")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame (width: 150, height: 150)
                    .foregroundColor(colorScheme == .dark ? .purple : .white)
                    .symbolEffect(.wiggle.right, options: .repeat(.periodic(5, delay: 1)))
                Text("Go for a hike today?")
                    .font(.custom("Futura", fixedSize: 25))
                    .foregroundColor(colorScheme == .dark ? .purple : .white)
                    .padding()
                VStack {
                    Picker("Pick", selection: $userPicked) {
     //                   Text("Yes").tag(0)
     //                   Text("No").tag(1)
     //                   Text("Trash").tag(2)
                        Image(systemName: "hand.thumbsup").tag(0)
                        Image(systemName: "hand.thumbsdown").tag(1)
                        Image(systemName: "trash").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    Text("Value: \(userPicked)")
                }
                
                
                
                Spacer()
                
            }
            
        }
        
    } // end body
} // end contentview

#Preview {
    ContentView()
}
