//
//  ProductsViewModel.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 01/03/22.
//

import Foundation
import UIKit
import SwiftyJSON

class ProductsViewModel: ObservableObject {
    @Published private(set) var products = Products()
    private var apiManger = ApiManager()
    
    func getNewProducts() {
        apiManger.getNewProducts { responseJson, error in
            if let responseJson = responseJson {
                let arrayCount = responseJson.array?.count ?? 0
                for i in 0..<arrayCount {
                    let product = responseJson[i]
                    let productInfo = ProductInfo(
                        name: product["name"].string ?? "",
                        price: product["price"].float ?? 0,
                        discountPrice: product["discountPrice"].float ?? 0,
                        description: product["description"].string ?? "",
                        imageURL: product["image"].string ?? ""
                    )
                    self.products.addProduct(productInfo)
                }
            } else if let error = error {
                print(error)
            }
        }
    }
}
