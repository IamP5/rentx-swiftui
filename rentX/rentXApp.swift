//
//  rentXApp.swift
//  rentX
//
//  Created by Bruno Gabriel on 05/03/22.
//

import SwiftUI
import Firebase

@main
struct rentXApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
