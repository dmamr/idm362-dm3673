import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = [] // task list array
    @State private var newTaskText: String = "" // input field
    @State private var animateSparkle = false // for sparkle animation
    @Environment(\.colorScheme) var colorScheme // detect dark/light mode
    
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
                        .foregroundColor(accentColor)
                }
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
