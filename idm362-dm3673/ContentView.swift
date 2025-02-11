import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = [] // task list array
    @State private var newTaskText: String = "" // input field
    @State private var showingHelp = false // to control showing the custom help alert
    @State private var animateSparkle = false // for sparkle animation
    @Environment(\.colorScheme) var colorScheme // detect dark/light mode
    
    // define theme colors
    var backgroundColor: Color {
        colorScheme == .dark ? Color(hex: "3b2c39") : Color(hex: "f6efe9")
    }
    var textColor: Color {
        colorScheme == .dark ? Color(hex: "f3d9ed") : Color(hex: "3b2c39")
    }
    var accentColor: Color {
        Color(hex: "c3a5c1")
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // app title
            HStack {
                if #available(iOS 17.0, *) {
                    Image(systemName: "sparkle")
                        .imageScale(.large)
                        .foregroundColor(accentColor)
                        .symbolEffect(.pulse)
                        .animation(.easeInOut(duration: 1).repeatForever(), value: animateSparkle)
                } else {
                    Image(systemName: "sparkle")
                        .imageScale(.large)
                        .foregroundColor(accentColor) // fallback for older versions
                }
                Text("ChecknGlow")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(textColor)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .shadow(color: Color(hex: "c3a5c1").opacity(0.3), radius: 7, x: 0, y: 2)
            
            // field for the text > adding the task
            HStack {
                ZStack(alignment: .leading) {
                    if newTaskText.isEmpty {
                        Text("add a task and check to glow :)")
                            .foregroundColor(textColor.opacity(0.6)) // lighter text color
                            .padding(.leading, 10)
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
                                .stroke(accentColor, lineWidth: 1)
                        )
                }
                .padding(.leading)
                
                Button(action: {
                    addTask()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .scaleEffect(1.5)
                        .foregroundColor(accentColor)
                        .padding()
                }
                .padding(.trailing)
            }
            .padding(.vertical)
            
            // task list loop
            List {
                ForEach($tasks) { $task in
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
                .onDelete(perform: deleteTask)
            }
            .scrollContentBackground(.hidden)
            .background(backgroundColor)
            
            // help button at the bottom left
            Button(action: {
                showingHelp.toggle()
            }) {
                Image(systemName: "questionmark.circle.fill")
                    .font(.title)
                    .scaleEffect(1.5)
                    .foregroundColor(accentColor)
                    .padding()
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(backgroundColor)
        .scrollContentBackground(.hidden)
        // custom alert overlay
        .overlay(
            showingHelp ? Color.black.opacity(0.4).edgesIgnoringSafeArea(.all) : nil
        )
        .overlay(
            VStack {
                if showingHelp {
                    VStack(spacing: 20) {
                        Text("a little tip:")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(accentColor)
                        
                        Text("to add a task, click the '+' button. if you want to delete it, just swipe left!")
                            .multilineTextAlignment(.center)
                            .foregroundColor(textColor)
                            .padding(.horizontal, 20)
                        
                        Button(action: {
                            showingHelp = false
                        }) {
                            Text("understoood")
                                .fontWeight(.bold)
                                .foregroundColor(backgroundColor)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(accentColor)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding()
                    .background(backgroundColor)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .padding(40)
                }
            }
        )
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
}

// extension to use hex colors
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6: // RGB (no alpha)
            (a, r, g, b) = (255, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        case 8: // ARGB (alpha included)
            (a, r, g, b) = ((int >> 24) & 0xFF, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
