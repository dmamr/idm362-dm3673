//
//  mainView.swift
//  idm362-dm3673
//
//  Created by Dariya Mamratova on 2/18/25.
//

import SwiftUI


struct mainView: View {
    
    // view switcher with a variable binding
    
    @State private var whichView: String = ""
    
    var body: some View {
        switch whichView {
            case "left":
            leftView(whichView: $whichView)
            case "right":
                rightView(whichView: $whichView)
        default:
            ContentView(whichView: $whichView)
            
        }
    }
}

#Preview {
    mainView()
}
