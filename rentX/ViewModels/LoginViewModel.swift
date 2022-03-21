//
//  LoginViewModel.swift
//  rentX
//
//  Created by Bruno Gabriel on 05/03/22.
//

import Foundation
import Firebase

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var userData: UserModel = UserModel(id: "", name: "", isAdmin: false)
    @Published var isLogged: Bool = false;
    
    func login() {
        
        Auth.auth()
            .signIn(withEmail: email, password: password) { (account, error) in
                
                if let error = error?.localizedDescription {
                    let errorPattern: String = "There is no user record corresponding to this identifier. The user may have been deleted."
                    let errorPattern2: String = "The password is invalid or the user does not have a password."
                    
                    if (error == errorPattern || error == errorPattern2) {
                        print("E-mail e/ou senha inválida")
                    } else {
                        print("Não foi possível realizar o login")
                    }
                } else {
                    guard let userId = account?.user.uid else {
                        print("Cannot get user id")
                        return
                    }
                    
                    let database = Firestore.firestore()
                    let docRef = database.collection("users").document(userId)
                    
                    docRef.getDocument { (document, error) in
                        if let document = document, document.exists
                        {
                            self.userData = UserModel(id: userId, name: document["name"] as! String, isAdmin: document["admin"] as! Bool)
                            self.isLogged = true
                        }
                    }
                }
            }
        print(self.userData)
    }
}
