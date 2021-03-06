//
//  ProductView.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 28/02/22.
//

import SwiftUI
import UIKit

struct CardProduct: View {
    let product: ProductInfo
    
    init(_ product: ProductInfo){
        self.product = product
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            AsyncImage(url: URL(string: product.imageURL)) { image in
                image
                    .resizable()
                    .frame(width: UIScreen.screenWidth*0.4, height: UIScreen.screenHeight*0.15)
            } placeholder: {
                Color.gray
            }
            .frame(width: UIScreen.screenWidth*0.4, height: UIScreen.screenHeight*0.15)
            
            VStack(alignment: .leading, spacing: 0){
                TextStyle(product.name, type: .small, bold: true, textColor: Color("Black")).padding(12)
                HStack(spacing: 0){
                    TextStyle("T", type: .small)
                        .padding(5)
                        .background(
                            Circle().foregroundColor(Color("Primary"))
                        )
                        .padding(.leading, 12)
                        .padding(.trailing, 4)
                    TextStyle("Tradly", type: .small, textColor: Color("Grey"))
                    Spacer()
                    TextStyle("$ \(product.price)", type: .small, textColor: Color("Primary"))
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
            CardProduct(ProductInfo(productId: 0, name: "teste", price: 15, discountPrice: 5, description: "teste", imageURL: ""))
        }
    }
}
