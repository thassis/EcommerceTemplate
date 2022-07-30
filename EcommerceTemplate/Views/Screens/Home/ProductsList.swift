//
//  ProductsList.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 28/02/22.
//

import SwiftUI

struct ProductsList: View {
    let productList: Array<ProductInfo>
    
    init(_ productList: Array<ProductInfo>){
        self.productList = productList
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                TextStyle("New Product", type: .medium, bold: true, textColor: Color("Black"))
                Spacer()
                TextStyle("See All", type: .small, bold: true)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 4)
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundColor(Color("Primary"))
                    )
            }
            ScrollView(.horizontal){
                HStack(spacing: 10) {
                    if(self.productList.count > 0){
                        ForEach(productList) { product in
                            NavigationLink(
                                destination: ProductDetails(
                                    id: product.productId,
                                    name: product.name
                                )
                            ) {
                                CardProduct(product)
                            }
                        }
                    } else {
                        VStack {                            
                            ProgressView()
                        }
                        .frame(width: UIScreen.screenWidth)
                    }
                }
            }
        }
    }
}

struct ProductsList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("background")
            VStack{
                ProductsList([ProductInfo(productId: 0, name: "teste", price: 15, discountPrice: 5, description: "teste", imageURL: "")])
                ProductsList([])
                
            }
        }
    }
}
