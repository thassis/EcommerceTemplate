//
//  Login.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 16/02/22.
//

import SwiftUI

struct SignUp: View {
    @EnvironmentObject var navigation: Navigation

    var body: some View {
        ZStack {
            Color("Primary").ignoresSafeArea()
            VStack{
                TextLarge("Welcome to Tradly")
                    .padding(.bottom, 64)
                
                TextMedium("Sign up to your account")
                    .padding([.bottom], 44)
                
                TextInput(placeholder: "First Name").padding(.bottom, 8)
                TextInput(placeholder: "Last Name").padding(.bottom, 8)
                TextInput(placeholder: "Email ID/Phone Number").padding(.bottom, 8)
                TextInput(placeholder: "Password").padding(.bottom, 8)
                TextInput(placeholder: "Re-enter Password").padding(.bottom, 36)
                
                FilledButton("Create", buttonStyle: FilledButton.Style.white)
                    .padding(.bottom, 32)
                
                Button {
                    navigation.navigate(to: "Login")
                } label: {
                    HStack(spacing: 0) {
                        TextMedium("Have an account?")
                        TextMedium(" Sign in", bold: true)
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
