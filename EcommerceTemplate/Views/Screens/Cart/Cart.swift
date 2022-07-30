//
//  Cart.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 29/07/22.
//

import SwiftUI

struct Cart: View {
    @EnvironmentObject var cart: ProductsCartViewModel
    @State private var products: Array<ProductCart>?
    
//    var products: Array<ProductCart> {
//        print(cart.productsCart.products.count)
//        return cart.productsCart.products
//    }
    
    var body: some View {
        VStack{
            if((products?.count ?? 0) > 0){
                ForEach(products!) { product in
                    TextStyle(product.product.name, type: .small, textColor: .black)
                }
            } else {
                TextStyle("no product is added", type: .medium, textColor: .black)
            }
        }
        .onAppear {
            print("on apperar pdp")
            return products = self.cart.productsCart.products
        }
    }
}

struct Cart_Previews: PreviewProvider {
    static var previews: some View {
        Cart()
    }
}
