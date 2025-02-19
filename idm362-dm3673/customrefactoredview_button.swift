//
//  customrefactoredview_button.swift
//  idm362-dm3673
//
//  Created by Dariya Mamratova on 2/18/25.
//

import SwiftUI

struct customrefactoredview_button: View {
//    p stands for parameter
    let pTitle: String
    let pImage: String
    let pAction: () -> Void
    
    var body: some View {
        VStack {
            Button(action: {
                //what to do when button is tapped
                pAction()
            }) {
                Label(pTitle, systemImage: pImage)
                    .padding(10)
                    .background(.white)
                    .foregroundColor(.purple)
                    .cornerRadius(10)
                   }
        }
    }
}

#Preview {
    customrefactoredview_button(
        pTitle: "Ghbdtn",
        pImage: "heart.fill",
        pAction: {
            print("Ghdbtn")
        }
    )
}
