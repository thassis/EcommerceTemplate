//
//  FilledButton.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 16/02/22.
//

import SwiftUI

struct FilledButton: View {
    let title: String
    let buttonStyle: ButtonStyle
    
    init(_ title: String, buttonStyle: ButtonStyle = Style.primary) {
        self.title = title
        self.buttonStyle = buttonStyle
    }
    
    var body: some View {
        Button {
            print("Button \(title) tapped!")
        } label: {
            TextMedium(title, bold: true, textColor: buttonStyle.textColor)
                .padding(.vertical, 16)
                .padding(.horizontal, 32)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(buttonStyle.fillColor)
                .cornerRadius(24)
                .padding(.horizontal, 32)
        }
    }
    
    struct ButtonStyle {
        let fillColor: Color
        let textColor: Color
    }

    enum Style {
        static var white: ButtonStyle {
            ButtonStyle(fillColor: .white, textColor: Color("Primary"))
        }
        static var primary: ButtonStyle {
            ButtonStyle(fillColor: Color("Primary"), textColor: .white)
        }
    }
}

struct FilledButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("Primary").ignoresSafeArea()
            FilledButton("Filled White", buttonStyle: FilledButton.Style.white)
        }
        FilledButton("Filled Primary")
    }
}
