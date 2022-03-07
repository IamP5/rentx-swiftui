//
//  UserModel.swift
//  rentX
//
//  Created by Bruno Gabriel on 05/03/22.
//

import Foundation


struct UserModel: Identifiable, Codable{
    let id : String
    let name: String
    let admin: Bool
    
    init(id: String , name: String, isAdmin: Bool) {
        self.id = id
        self.name = name
        self.admin = isAdmin
    }
}
