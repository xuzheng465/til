import SwiftUI

struct User: Comparable, Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String

    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

// content view
struct ContentView: View {
    @State private var users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Dave", lastName: "Lister"),
        User(firstName: "Ace", lastName: "Rimmer"),
    ]

    var body: some View {
        List(users) { user in
            Text("\(user.lastName), \(user.firstName)")
        }
        Button("Read and Write") {
          let data = Data("Testr Message".utf8)
          let url = URL.documentsDirectory.appending(path: "message.txt")

          

        }
    }
}
