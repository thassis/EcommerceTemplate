//
//  TextInput.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 16/02/22.
//

import SwiftUI

struct TextInput: View {
    @State private var username: String = ""
    let placeholder: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if username.isEmpty { Placeholder(text: placeholder) }
            TextField("", text: $username)
                .font(Font.custom("Montserrat-Medium", size: 16))
                .foregroundColor(Color.white)
                .autocapitalization(.none)
        }
        .padding(12)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.white, lineWidth: 1)
        )
        .padding([.horizontal], 32)
    }
}

struct Placeholder: View {
    let text: String
    var body: some View {
        Text(text)
            .font(Font.custom("Montserrat", size: 16))
            .foregroundColor(.white)
    }
}

struct TextInput_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("Primary").ignoresSafeArea()
            TextInput(placeholder: "Email/Mobile Number")
        }
    }
}
