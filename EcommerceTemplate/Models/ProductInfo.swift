//
//  ProductInfo.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 22/06/22.
//

import Foundation

struct ProductInfo: Identifiable, Codable {
    var id = UUID()
    var productId: Int
    let name: String
    let price: Float
    let discountPrice: Float
    let description: String
    let imageURL: String
}
