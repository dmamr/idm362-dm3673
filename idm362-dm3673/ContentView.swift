//
//  ContentView.swift
//  idm362-dm3673
//
//  Created by Dariya Mamratova on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    @State private var imageName: String = "Image"
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "sparkle")
                        .imageScale(.large)
                        .foregroundStyle(.purple)
                    Text("ChecknGlow")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .padding(.bottom, 10)
                
                Text("your simple n fancy task management app")
                    .font(.title3)
                    .foregroundColor(.purple)
                    .padding(.bottom, 20)
         
                    Text("""
                When analyzing the field of existing iOS applications with a similar idea, I noticed how they can be divided into two groups. It is either an app focusing primarily on task management, or an all-in-one workspace that combines note-taking, project management, and task organization.
                
                Most of them feature a minimalist and clean interface; labels, filters, and priorities for better comprehension. The workspace-type apps also offer the creation of pages for notetaking, working on the same documents with multiple users, and embedding rich content for thorough project planning.
                
                The drawbacks of the market's apps include either restricted customization choices (usually because there are free and premium versions) or a steep learning curve.
                
                How can I make my app better for its users?
                - Simplify the onboarding process
                - Enhance visual feedback by incorporating “glowing” achievements
                - Provide more customization options with some templates
                - Maybe add a gamification element with rewards and progress tracking to create a more engaging experience
                - Make it just a task management app, but add a feature of collaborating with people
                """)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .lineSpacing(5)
                    .padding(.trailing)
                   
                HStack {
                   Image(systemName: "sparkle")
                        .imageScale(.large)
                        .foregroundStyle(.purple)
                  Text("and this is me")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                                }
                .padding(.top, 30)
                .padding(.bottom, 10)
                                
                Text("the ideator and, hopefully, the developer of the app!")
                    .font(.title3)
                    .foregroundColor(.purple)
            }
            .padding()
          
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .padding(.bottom, 10)
                            }
            .padding()
                            
            Spacer()
                            
            Button(action: {
                imageName = (imageName == "Image") ? "shytan" : "Image"
            }) {
                Text("boop")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(10)
                            }
            .padding(.bottom, 20)
                        }
        .padding()
                    }
                }
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
