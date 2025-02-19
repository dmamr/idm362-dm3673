//
//  rightView.swift
//  idm362-dm3673
//
//  Created by Dariya Mamratova on 2/18/25.
//

import SwiftUI

struct rightView: View {

    
    // get color scheme from device
    @Environment(\.colorScheme) var colorScheme
    
    //view switcher with var binding
    @Binding var whichView: String
    
    var body: some View {
        ZStack() {
            LinearGradient(gradient: Gradient(colors: [
                colorScheme == .dark ? .black : .purple,
                colorScheme == .dark ? .purple : .orange]),
                startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                customrefactoredview_button(
                    pTitle: "Privet",
                    pImage: "sparkle",
                    pAction: {
                        print("'Hello' in Russian")
                    //update binded variable
                        whichView = ""
                    }
                )
                customrefactoredview_button(
                    pTitle: "Kak dela?",
                    pImage: "questionmark",
                    pAction: {
                        print("'How are you?' in Russian")
                        //update binded variable
                            whichView = "left"
                    }
                )
                customrefactoredview_button(
                    pTitle: "Poka",
                    pImage: "heart.fill",
                    pAction: {
                        print("'Bye' in Russian")
                        //update binded variable
                            whichView = "right"
                    }
                )
                Text("Bye!")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(30)
            }
            
            }
            
        }
        
    }

#Preview {
    // view switcher with var binding
    @Previewable @State var whichView: String = ""
    return rightView(whichView: $whichView)
}
