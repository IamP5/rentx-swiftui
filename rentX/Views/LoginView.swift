//
//  LoginView.swift
//  rentX
//
//  Created by Bruno Gabriel on 05/03/22.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
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
                    TextField("E-mail", text: $email)
                        .frame(height: 46)
                        .padding(.horizontal)
                        .background(.thickMaterial)
                        .cornerRadius(12)
                    
                    TextField("Password", text: $password)
                        .frame(height: 46)
                        .padding(.horizontal)
                        .background(.thickMaterial)
                        .cornerRadius(12)
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.all);
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LoginView()
        }
    }
}
