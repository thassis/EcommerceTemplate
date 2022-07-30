//
//  SearchViewModel.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 24/06/22.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published private(set) var searchProducts = Products()
    @Published private(set) var isLoading = false
    
    private var services = Services()
    
    func search(_ text: String){
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { //This is just for simulating a loading on View
            self.services.postSearch(search: text) { responseJson, error in
                if let responseJson = responseJson {
                    print(responseJson)
                    let arrayCount = responseJson.array?.count ?? 0
                    for i in 0..<arrayCount {
                        let product = responseJson[i]
                        let productInfo = ProductInfo(
                            productId: product["id"].int ?? 0,
                            name: product["name"].string ?? "",
                            price: product["price"].float ?? 0,
                            discountPrice: product["discountPrice"].float ?? 0,
                            description: product["description"].string ?? "",
                            imageURL: product["image"].string ?? ""
                        )
                        self.searchProducts.addProduct(productInfo)
                    }
                } else if let error = error {
                    print(error)
                }
                self.isLoading = false
            }
        }
    }
    
}
