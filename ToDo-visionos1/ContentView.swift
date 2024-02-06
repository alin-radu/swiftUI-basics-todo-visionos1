import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query private var todolists: [TodoList]
    @State private var selectedTodoList: TodoList? = nil

    @State private var showAddListAlert: Bool = false
    @State private var newListTitle: String = ""

    var body: some View {
        NavigationSplitView {
            List(todolists) { list in
                Button(list.title) {
                    selectedTodoList = list
                }
            }
            .navigationTitle("Todo List")
            .toolbar {
                Button("Add") {
                    showAddListAlert.toggle()
                }
            }
        } detail: {
            if let selectedTodoList = selectedTodoList {
                TodoListView(list: selectedTodoList)
            }
        }
        .alert("Add Todo List", isPresented: $showAddListAlert) {
            TextField("Todo List Title", text: $newListTitle)
            Button("Cancel", role: .cancel, action: {})
            Button("Create") {
                let list = TodoList(title: newListTitle)
                modelContext.insert(list)
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .modelContainer(for: TodoList.self)
}
