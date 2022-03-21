//
//  UserModel.swift
//  rentX
//
//  Created by Bruno Gabriel on 05/03/22.
//

import Foundation
import Firebase

struct UserModel: Identifiable, Codable{
    var id: String
    var name: String
    var isAdmin: Bool
    
    init(id: String, name: String, isAdmin: Bool) {
        self.id = id
        self.name = name
        self.isAdmin = isAdmin
    }
}
