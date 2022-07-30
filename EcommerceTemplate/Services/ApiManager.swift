//
//  ApiManager.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 26/04/22.
//

import Foundation
import SwiftyJSON

struct ApiManager {
    
    private struct BaseUrls {
        static let v1 = "http://127.0.0.1:3000"
        static let v2 = "https://apisconstants.herokuapp.com/v2"
    }
    
    private static let BaseUrl = BaseUrls.v1
    
    static let getProductsUrl = BaseUrl
    static let getNewProductsUrl = "\(BaseUrl)/newProducts/"
    static let getNewCategoriesUrl = "\(BaseUrl)/categories/"
    static let getPopularProductsUrl = "\(BaseUrl)/popularProducts/"
    static let getStoresUrl = "\(BaseUrl)/stores/"
    static let postSearchUrl = "\(BaseUrl)/search/"
    static let postBuyUrl = "\(BaseUrl)/buy/"
    static let getProductDetails = "\(BaseUrl)/productDetails?id={id}"
        
    static func fetchRequest(
        url: String,
        completionHandler: @escaping (JSON?, Error?) -> Void,
        httpMethod: String = "GET",
        body: Data? = nil,
        header: String = "application/json",
        forHTTPHeaderField: String = "Content-Type"
    ) {
        let url = URL(string: url)!
        var request = URLRequest(url: url)
        
        request.httpMethod = httpMethod
        request.setValue(header, forHTTPHeaderField: forHTTPHeaderField)
        
        if(body != nil){
            request.httpBody = body
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                print(data)
                DispatchQueue.main.async {
                    let responseJson = try! JSON(data: data)
                    completionHandler(responseJson, nil)
                }
                //                    print(json[0]["name"])
            } else if let error = error {
                print("HTTP Request Failed \(error)")
                completionHandler(nil, error)
            }
        }
        task.resume()
    }
}
