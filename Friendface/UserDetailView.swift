//
//  UserDetailView.swift
//  Friendface
//
//  Created by Pascal Hintze on 30.11.2023.
//

import SwiftUI

struct UserDetailView: View {
    
    let user: User
    
    var body: some View {
        ScrollView {
            VStack {
                Text(user.name)
                    .font(.title.bold())
                
                Text("About")
                    .font(.title2.bold())
                    .padding(.bottom, 5)
                
                VStack(alignment: .leading) {

                    Text(user.about)
                        .padding()
                    VStack(alignment: .leading) {
                        Text("Active user: \(user.isActive ? "Yes" : "No")")
                        Text("Age: \(user.age)")
                        Text("Company: \(user.company)")
                        Text("Email: \(user.email)")
                        Text("Address: \(user.address)")
                        Text("Registration date: \(user.registered.formatted())")
                    }
                    .padding(10)
                    
                    RectangleDivider()
                    VStack(alignment: .leading) {
                        Text("Friends")
                            .font(.title2.bold())
                            .padding(.bottom, 5)
                        
                        ForEach(user.friends) { friend in
                            Text("- \(friend.name)")
                        }
                    }
                    .padding(10
                    )
                    RectangleDivider()
                    VStack(alignment: .leading) {
                    Text("Tags")
                        .font(.title2.bold())
                        .padding(.bottom, 5)
                        
                        ForEach(0..<user.tags.count, id: \.self) {
                            Text("#\(user.tags[$0])")
                                .padding(.leading, 5)
                        }
                    }
                    .padding(10)
                }
            }
        }
    }
    init(user: User) {
        self.user = user
    }
    
}

#Preview {
    UserDetailView(user: User(id: "1", isActive: true, name: "Peter Pan", age: 10, company: "Blackrock", email: "peter.pan@mail.com", address: "Street 1, London", about: "Peter Pan is a comic character in a disney movie", registered: .now, tags: ["friendly", "funny"], friends: [User.Friend(id: "2", name: "Lilly Fee"), User.Friend(id: "3", name: "Captain Hook")]))
}
