//
//  ProductsViewModel.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 01/03/22.
//

import Foundation
import Alamofire

struct DecodableType: Decodable { let url: String }

class ProductsViewModel: ObservableObject {
    @Published private var products: Products?
    
    func getNewProducts(){
        AF.request("https://httpbin.org/get").responseDecodable(of: DecodableType.self) { response in
            debugPrint("Response: \(response.value)")
        }
    }
}
