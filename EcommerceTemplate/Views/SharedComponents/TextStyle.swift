//
//  TextLarge.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 16/02/22.
//

import SwiftUI

struct TextStyle: View {
    var text: String
    var bold: Bool
    var textColor: Color
    var fontSize: Int
    var fontFamily: String
    
    init(_ text: String, type: TextTypes?, bold: Bool = false, textColor: Color = Color.white){
        self.text = text
        self.bold = bold
        self.textColor = textColor
        
        switch type {
        case .small:
            fontSize = 14
            fontFamily = "Montserrat"
        case .medium:
            fontSize = 18
            fontFamily = "Montserrat"
        case .large:
            fontSize = 24
            fontFamily = "Montserrat-Medium"
        default:
            fontSize = 16
            fontFamily = "Montserrat"
        }
    }
    
    
    var body: some View {
        let textView = Text(text)
            .font(Font.custom(fontFamily, size: CGFloat(fontSize)))
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
                TextStyle("This is bold", type: .small, bold: true)
                TextStyle("This is not bold", type: .large, bold: false)
            }
        }
    }
}
