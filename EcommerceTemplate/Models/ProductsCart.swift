//
//  ProductsCart.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 29/07/22.
//

import Foundation

struct ProductCart: Identifiable {
    var id = UUID()
    var product: ProductInfo
    var amount: Int
}

struct ProductsCart {
    private(set) var products: Array<ProductCart>
        
    init(_ products: Array<ProductCart> = []){
        self.products = products;
    }
    
    mutating func addProduct(_ product: ProductCart){
        self.products.append(product)
    }
    
    mutating func changeAmount(productId: Int, amount: Int){
        if let index = products.firstIndex(where: {$0.product.productId == productId}) {
            products[index].amount = amount
        }
    }
}
