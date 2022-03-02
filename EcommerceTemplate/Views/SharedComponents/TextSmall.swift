//
//  TextLarge.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 16/02/22.
//

import SwiftUI

struct TextSmall: View {
    var text: String
    var bold: Bool
    var textColor: Color
    
    init(_ text: String, bold: Bool = false, textColor: Color = Color.white){
        self.text = text
        self.bold = bold
        self.textColor = textColor
    }

    
    var body: some View {
        let textView = Text(text)
            .font(Font.custom("Montserrat", size: 16))
            .foregroundColor(textColor)
        if(bold){ textView.fontWeight(.bold) }
        else { textView }
    }
}

struct TextSmall_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("Primary").ignoresSafeArea()
            VStack{
                TextSmall("This is bold", bold: true)
                TextSmall("This is not bold", bold: false)
            }
        }
    }
}
