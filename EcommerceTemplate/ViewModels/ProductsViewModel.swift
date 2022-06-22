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
    @Published private(set) var newProducts = Products()
    @Published private(set) var popularProducts = Products()
    
    private var services = Services()
    
    func saveProductsList(_ responseJson: JSON?, _ error: Error?, isNewProduct: Bool ) {
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
                if(isNewProduct){
                    self.newProducts.addProduct(productInfo)
                } else {
                    self.popularProducts.addProduct(productInfo)
                }
            }
        } else if let error = error {
            print(error)
        }
    }
    
    func getNewProducts() {
        services.getNewProducts { responseJson, error in
            self.saveProductsList(responseJson, error, isNewProduct: true)
        }
    }
    
    func getPopularProducts() {
        services.getPopularProducts { responseJson, error in
            self.saveProductsList(responseJson, error, isNewProduct: false)
        }
    }
}
