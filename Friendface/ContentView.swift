//
//  ContentView.swift
//  Friendface
//
//  Created by Pascal Hintze on 30.11.2023.
//

import SwiftData
import SwiftUI

struct Response: Codable {
    var results: [User]
}

struct ContentView: View {
    @Environment (\.modelContext) var modelContext
    @Query(sort: \User.name) private var users: [User]
    
    
    var body: some View {
        NavigationStack {
            List(users) { item in
                NavigationLink(destination: UserDetailView(user: item)){
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.isActive ? "Active" : "Inactiv")
                    }
                }
            }
            .navigationTitle("Users")
        }
        .task {
            await fetchUsers()
        }
    }
    
    func fetchUsers() async {
        guard users.isEmpty else { return }
        
        do {
            let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            // Check why the following line is needed and
            // users = try JSONDecoder().decode([User].self, from: data)
            // is not working
            decoder.dateDecodingStrategy = .iso8601
            
            let downloadedUsers = try decoder.decode([User].self, from: data)
            let insertContext = ModelContext(modelContext.container)
            
            for user in downloadedUsers {
                insertContext.insert(user)
            }
            
            try insertContext.save()
        } catch {
            print("Invalid data")
        }
    }
    
}

#Preview {
    ContentView()
}
