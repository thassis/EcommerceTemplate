//
//  Product.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 28/02/22.
//

import Foundation

struct ProductInfo: Identifiable {
    let id = UUID()
    let name: String
    let price: Float
    let discountPrice: Float
    let description: String
    let imageURL: String
}
