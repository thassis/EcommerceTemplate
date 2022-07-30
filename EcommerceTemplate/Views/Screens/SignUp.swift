//
//  Login.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 16/02/22.
//

import SwiftUI

struct SignUp: View {
    var body: some View {
        ZStack {
            Color("Primary").ignoresSafeArea()
            VStack{
                TextStyle("Welcome to Tradly", type: .large)
                    .padding(.bottom, 64)
                
                TextStyle("Sign up to your account", type: .medium)
                    .padding([.bottom], 44)
                
                TextInput(placeholder: "First Name"){ text in
                    print(text ?? "")
                }
                .padding(.bottom, 8)
                TextInput(placeholder: "Last Name"){ text in
                    print(text ?? "")
                }
                .padding(.bottom, 8)
                TextInput(placeholder: "Email ID/Phone Number"){ text in
                    print(text ?? "")
                }
                .padding(.bottom, 8)
                TextInput(placeholder: "Password"){ text in
                    print(text ?? "")
                }
                .padding(.bottom, 8)
                TextInput(placeholder: "Re-enter Password"){ text in
                    print(text ?? "")
                }
                .padding(.bottom, 36)
                
                NavigationLink(destination: TabViews()) {
                    FilledButton("Create", buttonStyle: FilledButton.Style.white, onPress: {})
                        .padding(.bottom, 32)
                }
                
                NavigationLink(destination: Login()) {
                    HStack(spacing: 0) {
                        TextStyle("Have an account?", type: .medium)
                        TextStyle(" Sign in", type: .medium, bold:  true)
                    }
                }
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignUp()
        }
    }
}
