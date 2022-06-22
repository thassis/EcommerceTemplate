//
//  CardStore.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 28/02/22.
//

import SwiftUI

struct CardStore: View {
    var body: some View {
        VStack(spacing: 0){
                Image("breads")
                    .resizable()
                    .frame(width: UIScreen.screenWidth*0.4, height: UIScreen.screenHeight*0.1)
            TextStyle("T", type: .large)
                    .padding(16)
                    .background(
                        Circle()
                            .strokeBorder(Color.white, lineWidth: 1)
                            .background(Circle().fill(Color("Primary")))
                    )
                    .offset(y: -32)
                    .padding(.bottom, -32)

            TextStyle("Tradly Store", type: .small, bold: true, textColor: Color("Black"))
                .padding([.bottom, .horizontal], 16)
            
            TextStyle("Follow", type: .small, bold: true)
                .padding(.horizontal, 24)
                .padding(.vertical, 4)
                .background(
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundColor(Color("Primary"))
                )
                .padding(.bottom, 16)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 0)
                .stroke(Color("BorderColor"), lineWidth: 0.5)
        )
        .background(Color.white)
        .cornerRadius(8)
        .frame(width: UIScreen.screenWidth*0.4)
    }
}

struct CardStore_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("Primary")
            CardStore()
        }
    }
}
