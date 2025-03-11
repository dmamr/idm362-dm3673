//
//  InstructionsView.swift
//  idm362-dm3673
//
//  Created by Dariya Mamratova on 2/11/25.
//

import SwiftUI

struct InstructionsView: View {
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
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "sparkle")
                    .imageScale(.large)
                    .foregroundColor(accentColor)
                Text("Instructions")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(textColor)
            }
            .padding(.top, 80)
            .padding(.bottom, 20)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .shadow(color: accentColor.opacity(0.3), radius: 7, x: 0, y: 2)
            
            
            // instructions body (centered)
            Text("to add a task, type your task in the input field and click the '+' button. to delete a task, simply swipe left on the task in the list!")
                .font(.body)
                .foregroundColor(textColor)
                .multilineTextAlignment(.leading)
                .padding()
            
            Spacer()
        }
        .background(backgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
}
