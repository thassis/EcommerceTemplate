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
    
    func getNewProducts() {
        let url = URL(string: "https://apisconstants.herokuapp.com/")!
        
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async { [weak self] in
                    
                    let responseJson = try! JSON(data: data)
                    let arrayCount = responseJson.array?.count ?? 0
                    for i in 0..<arrayCount {
                        let product = responseJson[i]
                        let productInfo = ProductInfo(name: product["name"].string ?? "", price: product["price"].float ?? 0, discountPrice: product["discountPrice"].float ?? 0, description: product["description"].string ?? "", imageURL: product["image"].string ?? "")
                        print(productInfo)
                        self!.products.addProduct(productInfo)
                    }
                }
                //                    print(json[0]["name"])
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
        task.resume()
    }
}
