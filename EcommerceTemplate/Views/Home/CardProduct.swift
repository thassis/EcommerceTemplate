//
//  ProductView.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 28/02/22.
//

import SwiftUI

struct CardProduct: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Image("breads")
                .resizable()
                .frame(width: UIScreen.screenWidth*0.4, height: UIScreen.screenHeight*0.15)

            VStack(alignment: .leading, spacing: 0){
                TextSmall("Fish", bold: true, textColor: Color("Black")).padding(12)
                HStack{
                    TextSmall("T")
                        .padding(5)
                        .background(
                            Circle().foregroundColor(Color("Primary"))
                        )
                        .padding(.leading, 12)
                    TextSmall("Tradly", textColor: Color("Grey"))
                    Spacer()
                    TextSmall("$25", textColor: Color("Primary"))
                        .padding(.trailing, 12)
                }
                .padding(.bottom, 12)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(Color("BorderColor"), lineWidth: 0.5)
            )
        }
        .background(Color.white)
        .cornerRadius(8)
        .frame(width: UIScreen.screenWidth*0.4)
    }
}

struct CardProduct_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            CardProduct()
        }
    }
}
