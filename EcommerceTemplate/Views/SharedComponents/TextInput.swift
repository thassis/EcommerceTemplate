//
//  TextInput.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 16/02/22.
//

import SwiftUI

let transparentColor = Color.white.opacity(0)

struct TextInput: View {
    let placeholder: String
    let bgColor: Color
    let fontColor: Color
    let leftImgName: String
    var onSubmit: (String?) -> Void
    
    init(placeholder: String, bgColor: Color = transparentColor, fontColor: Color = Color.white, leftImgName: String = "", _ onSubmit: @escaping (_ text: String?) -> Void
    ){
        self.placeholder = placeholder
        self.bgColor = bgColor
        self.fontColor = fontColor
        self.leftImgName = leftImgName
        self.onSubmit = onSubmit
    }
    
    var body: some View {
        if(self.bgColor == transparentColor){
            TextInputView(placeholder: placeholder, fontColor: fontColor, leftImgName: leftImgName
            ){ text in
                self.onSubmit(text)
            }
                .overlay(
                    RoundedRectangle(cornerRadius: 24)
                        .stroke(Color.white, lineWidth: 1)
                )
                .padding([.horizontal], 32)
        } else {
            TextInputView(placeholder: placeholder, fontColor: fontColor, leftImgName: leftImgName
            ) { text in
                self.onSubmit(text)
            }
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(self.bgColor)
                )
                .padding([.horizontal], 32)
        }
    }
}

struct TextInputView: View {
    @State private var textValue: String = ""
    let placeholder: String
    let fontColor: Color
    let leftImgName: String
    var onSubmit: (String?) -> Void
    
    var body: some View {
        HStack(spacing: 0){
            if !leftImgName.isEmpty {
                Image(systemName: self.leftImgName)
                    .foregroundColor(Color("Primary"))
                    .padding(.leading, 16)
                    .onTapGesture {
                        self.onSubmit(textValue)
                    }
            }
            ZStack(alignment: .leading) {
                if textValue.isEmpty { Placeholder(text: placeholder, fontColor: fontColor) }
                TextField("", text: $textValue)
                    .font(Font.custom("Montserrat-Medium", size: 16))
                    .foregroundColor(fontColor)
                    .autocapitalization(.none)
                    .onSubmit {
                        self.onSubmit(textValue)
                    }
            }
            .padding(12)
        }
    }
}

struct Placeholder: View {
    let text: String
    let fontColor: Color
    
    var body: some View {
        Text(text)
            .font(Font.custom("Montserrat", size: 16))
            .foregroundColor(fontColor)
    }
}

struct TextInput_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("Primary").ignoresSafeArea()
            VStack{
                TextInput(
                    placeholder: "Email/Mobile Number"
                ) { text in
                    print(text ?? "")
                }
                TextInput(
                    placeholder: "Email/Mobile Number",
                    bgColor: Color.white,
                    fontColor: Color("Black"),
                    leftImgName: "magnifyingglass")
                { text in
                    print(text ?? "")
                }
            }
        }
    }
}
