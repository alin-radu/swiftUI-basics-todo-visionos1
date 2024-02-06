import SwiftData
import SwiftUI

struct TodoListView: View {
    @Environment(\.modelContext) private var modelContext

    @State var list: TodoList

    @State private var newTodoTitle: String = ""
    @State private var showAddTodoAlert: Bool = false

    var body: some View {
        List {
            Section("Todo") {
                ForEach(list.items.filter { $0.isDone == false }) { item in
                    HStack {
                        Button {
                            withAnimation {
                                item.isDone.toggle()
                            }
                        } label: {
                            Image(systemName: item.isDone ? "circle.fill" : "circle")
                                .foregroundColor(.blue)
                        }
                        Text(item.title)
                        Spacer()
                    }
                }
            }
            Section("Done") {
                ForEach(list.items.filter { $0.isDone == true }) { item in
                    HStack {
                        Button {
                            withAnimation {
                                item.isDone.toggle()
                            }
                        } label: {
                            Image(systemName: item.isDone ? "circle.fill" : "circle")
                                .foregroundColor(.blue)
                        }
                        Text(item.title)
                        Spacer()
                    }
                }
            }
        }
        .navigationTitle("Details for \(list.title)")
        .toolbar {
            Button("Add Todo") {
                showAddTodoAlert.toggle()
            }
        }
        .alert("Add Todo", isPresented: $showAddTodoAlert) {
            TextField("Todo Title", text: $newTodoTitle)
            Button("Cancel", role: .cancel, action: {})
            Button("Create") {
                let todo = TodoItem(title: newTodoTitle)
                modelContext.insert(todo)
                list.items.append(todo)
            }
        }
    }
}
