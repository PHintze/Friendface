//
//  User.swift
//  Friendface
//
//  Created by Pascal Hintze on 30.11.2023.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    struct Friend: Codable, Identifiable, Hashable {
        var id: String
        var name: String
        
        init(id: String, name: String) {
            self.id = id
            self.name = name
        }
    }
    
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    
    init(id: String, isActive: Bool, name: String, age: Int, company: String, email: String, address: String, about: String, registered: Date, tags: [String], friends: [Friend]) {
        self.id = UUID()
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.email = email
        self.address = address
        self.about = about
        self.registered = registered
        self.tags = tags
        self.friends = friends
    }
}
