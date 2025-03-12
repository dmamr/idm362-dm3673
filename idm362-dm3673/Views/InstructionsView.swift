import SwiftUI

struct InstructionsView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var sparkleFrame = 0 // keeps track of animation frames
    
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

    // selecting correct folder for animation based on color scheme
    var sparkleImageName: String {
        colorScheme == .dark ?
        "DarkSparkleAnimation/animated_dark_sparkle_\(String(format: "%05d", sparkleFrame))" :
        "LightSparkleAnimation/animated_light_sparkle_\(String(format: "%05d", sparkleFrame))"
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // app title with animated sparkle
            HStack {
                Image(sparkleImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .onAppear { startAnimation() } // starts the animation
                
                Text("checknglow")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(textColor)
            }
            .padding(.top, (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.safeAreaInsets.top ?? 0)
            .padding()
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .shadow(color: accentColor.opacity(0.5), radius: 5, x: 0, y: 2)
            
            // instructions body (centered)
                VStack(alignment: .center) {
                    Text("instructions")
                        .frame(maxWidth: .infinity)
                        .font(.title2)
                        .fontWeight(.medium)
                }
                .font(.body)
                .foregroundColor(textColor)
                .multilineTextAlignment(.leading)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(textColor, lineWidth: 1).background(backgroundColor))
                .padding()
            
            VStack(alignment: .leading) {
                Text("1. type your task in the input field and click the '+' button to add it")
                    .padding(.vertical, 5)
                Text("2. simply swipe left on the task in the list to delete it")
                    .padding(.vertical, 5)
                Text("3. tap the task if you want to add more information and leave notes")
                    .padding(.vertical, 5)
                Text("4. reorganize your tasks by dragging them in the list")
                    .padding(.vertical, 5)
                Text("5. check your tasks and glow with joy!")
                    .padding(.vertical, 5)
            }
            .frame(maxWidth: .infinity)
            .font(.body)
            .foregroundColor(textColor)
            .multilineTextAlignment(.leading)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).stroke(textColor, lineWidth: 1).background(backgroundColor))
            .padding()
            
            Spacer()
        }
        .background(backgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
    
    // function to cycle through animation frames
    func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            sparkleFrame = (sparkleFrame + 1) % 48 // Loop through frames 00000-00047
        }
    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView()
    }
}

