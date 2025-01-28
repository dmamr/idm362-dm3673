import SwiftUI

struct ContentView: View {
    @State private var tasks: [Task] = [] // task list array
    @State private var newTaskText: String = "" // input field
    
    var body: some View {
        VStack(spacing: 0) {
            // app title
            HStack {
                Image(systemName: "sparkle")
                    .imageScale(.large)
                    .foregroundColor(.purple)
                Text("ChecknGlow")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(uiColor: UIColor.systemBackground))
            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
            
            // field for the text > adding the task
            HStack {
                ZStack(alignment: .leading) {
                    if newTaskText.isEmpty {
                        Text("Add a task...")
                            .foregroundColor(Color.secondary) //
                            .padding(.leading, 10)
                    }
                                
                                TextField("Add a task...", text: $newTaskText)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 15)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color(uiColor: UIColor.systemGray6))
                                    )
                                    .foregroundColor(Color.primary)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color(uiColor: UIColor.separator), lineWidth: 1)
                                    )
                                        
                                        }
                    .padding(.leading)
                    
                
                Button(action: {
                    addTask()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundColor(Color(hue: 0.837, saturation: 0.369, brightness: 0.886))
                }
                .padding(.trailing)
            }
            .padding(.vertical)
            
            // task list loop
            List {
                ForEach($tasks) { $task in
                    HStack {
                        Text(task.title)
                            .strikethrough(task.isDone, color: .purple)
                            .foregroundColor(task.isDone ? .gray : .primary)
                        Spacer()
                        Toggle("", isOn: $task.isDone)
                            .labelsHidden()
                            .tint(Color(hue: 0.837, saturation: 0.369, brightness: 0.886))
                    }
                }
                .onDelete(perform: deleteTask)
            }
            .scrollContentBackground(.hidden)
            .background(Color(uiColor: UIColor.systemBackground))
        }
        .background(Color(uiColor: UIColor.systemBackground))
        .scrollContentBackground(.hidden)
    }
    
    // adding a new task to the list
    func addTask() {
        guard !newTaskText.isEmpty else { return }
        tasks.append(Task(id: UUID(), title: newTaskText, isDone: false))
        newTaskText = ""
    }
    
    // removing the task by seiping it
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

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
                    .preferredColorScheme(.dark) // Preview in dark mode
                ContentView()
                    .preferredColorScheme(.light)
    }
}
