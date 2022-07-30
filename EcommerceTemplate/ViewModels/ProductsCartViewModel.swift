//
//  ProductsCartViewModel.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 29/07/22.
//

import Foundation

class ProductsCartViewModel: ObservableObject {
    private(set) var productsCart = ProductsCart()
    
    func addProductToCart(_ product: ProductInfo) {
        let productCart = ProductCart(product: product, amount: 1)
        self.productsCart.addProduct(productCart)
    }
}
