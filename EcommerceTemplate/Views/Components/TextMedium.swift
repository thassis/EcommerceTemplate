//
//  TextLarge.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 16/02/22.
//

import SwiftUI

struct TextMedium: View {
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
            .font(Font.custom("Montserrat", size: 18))
            .foregroundColor(textColor)
        if(bold){ textView.fontWeight(.bold) }
        else { textView }
    }
}

struct TextMedium_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("Primary").ignoresSafeArea()
            VStack{
                TextMedium("This is bold", bold: true)
                TextMedium("This is not bold", bold: false)
            }
        }
    }
}
