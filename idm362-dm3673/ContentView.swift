//
//  ContentView.swift
//  idm362-dm3673
//
//  Created by Dariya Mamratova on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "sparkle")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
