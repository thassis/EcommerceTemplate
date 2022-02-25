//
//  TextLarge.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 16/02/22.
//

import SwiftUI

struct TextLarge: View {
    let text: String
    
    init(_ text: String){
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(Font.custom("Montserrat-Medium", size: 24))
            .foregroundColor(Color.white)
    }
}

struct TextLarge_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("Primary").ignoresSafeArea()
            TextLarge("Text")
        }
    }
}
