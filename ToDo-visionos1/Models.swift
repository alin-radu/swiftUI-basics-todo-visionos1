import Foundation
import SwiftData

@Model
class TodoItem {
    var title: String
    var isDone = false

    init(title: String) {
        self.title = title
    }
}

@Model
class TodoList {
    var title: String

    @Relationship(deleteRule: .cascade)
    var items: [TodoItem] = []

    init(title: String) {
        self.title = title
    }
}
