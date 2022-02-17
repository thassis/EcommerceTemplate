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
                TextLarge("Welcome to Tradly")
                    .padding([.bottom], 64)
                
                TextMedium("Login to your account")
                    .padding([.bottom], 44)
                
                TextInput(placeholder: "Email/Mobile Number").padding(.bottom, 8)
                TextInput(placeholder: "Password").padding(.bottom, 36)
                
                FilledButton("Login", buttonStyle: FilledButton.Style.white)
                    .padding(.bottom, 32)
                
                Button {
                    print("press forgot your password")
                } label: {
                    TextMedium("Forgot your password?").padding(.bottom, 48)
                }
                
                Button {
                    print("press sign up")
                } label: {
                    HStack(spacing: 0) {
                        TextMedium("Don't you have an account?")
                        TextMedium(" Sign up", bold: true)
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
