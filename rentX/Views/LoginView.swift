//
//  LoginView.swift
//  rentX
//
//  Created by Bruno Gabriel on 05/03/22.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginViewModel: LoginViewModel = LoginViewModel()
    
    @State private var loginFailedPopup = false;
    @State private var popupMessage: String = "";
    
    var body: some View {
        if (loginViewModel.isLogged) {
            HomeView()
        } else {
            loginContent
        }
    }
    
    var loginContent: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [
                .red,
                .pink
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
            
            VStack {
                HStack(alignment: .center) {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .colorMultiply(.black)
                }
                .frame(maxWidth: .infinity, maxHeight: 180)
                .padding(.horizontal, 60)
                
            
                VStack {
                    TextField("E-mail", text: $loginViewModel.email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .frame(height: 46)
                        .padding(.horizontal)
                        .background(.thickMaterial)
                        .cornerRadius(12)
                    
                    SecureField("Password", text: $loginViewModel.password)
                        .frame(height: 46)
                        .padding(.horizontal)
                        .background(.thickMaterial)
                        .cornerRadius(12)
                    
                    Button(action: handleLogin, label: {
                        Text("Login".uppercased())
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(.black)
                            .cornerRadius(12)
                    })
                        .padding(.vertical)
                }
                .padding(.horizontal, 26)
                .alert(isPresented: self.$loginFailedPopup, content: {
                    Alert(title: Text(popupMessage), dismissButton: .cancel(Text("Try again")))
                })
            }
        }
        .ignoresSafeArea(.container);
    }
    
    func handleLogin() {
        let loginStatus = loginViewModel.login()
        self.popupMessage = loginStatus
        
        loginFailedPopup = loginStatus != "Success"
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
