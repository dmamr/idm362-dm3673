//
//  InstructionsView.swift
//  idm362-dm3673
//
//  Created by Dariya Mamratova on 2/11/25.
//

import SwiftUI

struct InstructionsView: View {
    @Environment(\.colorScheme) var colorScheme

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
