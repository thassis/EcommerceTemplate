//
//  Login.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 16/02/22.
//

import SwiftUI

struct Login: View {    
    var body: some View {
        ZStack {
            Color("Primary").ignoresSafeArea()
            VStack{
                TextStyle("Welcome to Tradly", type: .large)
                    .padding([.bottom], 64)
                
                TextStyle("Login to your account", type: .medium)
                    .padding([.bottom], 44)
                
                TextInput(placeholder: "Email/Mobile Number"){ text in
                    print(text ?? "")
                }
                .padding(.bottom, 8)
                
                TextInput(placeholder: "Password"){ text in
                    print(text ?? "")
                }
                .padding(.bottom, 36)
                
                NavigationLink(destination: TabViews()) {
                    FilledButton("Login", buttonStyle: FilledButton.Style.white, onPress: {})
                        .padding(.bottom, 32)
                }
                
                Button {
                    print("press forgot your password")
                } label: {
                    TextStyle("Forgot your password?", type: .medium).padding(.bottom, 48)
                }
                
                NavigationLink(destination: SignUp()) {
                    HStack(spacing: 0) {
                        TextStyle("Don't you have an account?", type: .medium)
                        TextStyle(" Sign up", type: .medium, bold: true)
                    }
                }
            }
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Login()
        }
    }
}
