import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = [] // task list array
    @State private var newTaskText: String = "" // input field
    @State private var animateSparkle = false // for sparkle animation
    @State private var sparkleFrame = 0 // keeps track of animation frames
    @Environment(\.colorScheme) var colorScheme // detect dark/light mode
    
    // using asset catalog colors
    var backgroundColor: Color { Color("BackgroundColor") }
    var textColor: Color { Color("TextColor") }
    var accentColor: Color { Color("AccentColor") }

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
            .padding()
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .shadow(color: accentColor.opacity(0.3), radius: 7, x: 0, y: 2)
            
            // field for adding a task
            HStack {
                ZStack(alignment: .leading) {
                    if newTaskText.isEmpty {
                        Text("add a task and check to glow :)")
                            .foregroundColor(textColor.opacity(0.6))
                            .padding(.leading, 15)
                    }
                    
                    TextField("", text: $newTaskText)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 15)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(accentColor.opacity(0.2))
                        )
                        .foregroundColor(textColor)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(textColor, lineWidth: 1)
                        )
                }
                .padding(.leading)
                
                Button(action: {
                    addTask()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .scaleEffect(1.5)
                        .foregroundColor(textColor)
                        .padding()
                    
                }
                .padding(.trailing)
            }
            .padding(.vertical)
            
            // task list loop with collapsable notes for each task
            List {
                ForEach($tasks) { $task in
                    DisclosureGroup(isExpanded: $task.isExpanded) {
                        // expanded view: "important notes..." text above the TextEditor
                        VStack(alignment: .leading, spacing: 5) {
                            Text("important notes...")
                                .font(.callout)
                                .foregroundColor(textColor.opacity(0.7))
                            
                            TextEditor(text: $task.notes)
                                .frame(height: 100)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                                )
                                .frame(maxWidth: .infinity)
                        }
                    } label: {
                        HStack {
                            Text(task.title)
                                .strikethrough(task.isDone, color: accentColor)
                                .foregroundColor(task.isDone ? textColor.opacity(0.6) : textColor)
                            Spacer()
                            Toggle("", isOn: $task.isDone)
                                .labelsHidden()
                                .tint(accentColor)
                        }
                    }
                }
                .onDelete(perform: deleteTask)
            }
            .scrollContentBackground(.hidden)
            .background(backgroundColor)
        }
        .background(backgroundColor)
        .scrollContentBackground(.hidden)
        .onAppear {
            animateSparkle = true
        }
    }
    
    // function to cycle through animation frames
    func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            sparkleFrame = (sparkleFrame + 1) % 48 // Loop through frames 0-47
        }
    }
    
    // adding a new task to the list
    func addTask() {
        guard !newTaskText.isEmpty else { return }
        tasks.append(Task(id: UUID(), title: newTaskText, isDone: false))
        newTaskText = ""
    }
    
    // removing the task by swiping it
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

// task unique identifier, etc.
struct Task: Identifiable {
    let id: UUID
    var title: String
    var isDone: Bool
    var notes: String = ""
    var isExpanded: Bool = false
}

// preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
