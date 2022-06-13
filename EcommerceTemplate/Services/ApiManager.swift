//
//  ApiManager.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 26/04/22.
//

import Foundation
import SwiftyJSON

enum BaseUrls: String {
    case v1 = "https://apisconstants.herokuapp.com"
    case v2 = "https://apisconstants.herokuapp.com/v2"
}

struct ApiManager {
    
    private let getProductsUrl = BaseUrls.v1.rawValue
    private let getNewProductsUrl = "\(BaseUrls.v1.rawValue)/newProducts/"
    private let getNewCategoriesUrl = "\(BaseUrls.v1.rawValue)/categories/"
    private let getPopularProductsUrl = "\(BaseUrls.v1.rawValue)/popularProducts/"
    private let getStoresUrl = "\(BaseUrls.v1.rawValue)/stores/"
    private let postSearchUrl = "\(BaseUrls.v1.rawValue)/search/"
    private let postBuyUrl = "\(BaseUrls.v1.rawValue)/buy/"
    
    func fetchRequest(
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
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
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
    
    func getNewProducts(_ completionHandler: @escaping (JSON?, Error?) -> Void) {
        //Change the url according to given params before call GET Request
        fetchRequest(url: getProductsUrl, completionHandler: { requests, error in
            if let requests = requests {
                completionHandler(requests, nil)
            } else if let error = error {
                completionHandler(nil, error)
            }
        })
    }
    
    func getNewCategories(_ completionHandler: @escaping (JSON?, Error?) -> Void) {
        fetchRequest(url: getNewCategoriesUrl, completionHandler: { requests, error in
            if let requests = requests {
                completionHandler(requests, nil)
            } else if let error = error {
                completionHandler(nil, error)
            }
        })
    }
    
    func getPopularProducts(_ completionHandler: @escaping (JSON?, Error?) -> Void) {
        fetchRequest(url: getPopularProductsUrl, completionHandler: { requests, error in
            if let requests = requests {
                completionHandler(requests, nil)
            } else if let error = error {
                completionHandler(nil, error)
            }
        })
    }
    
    func getStores(_ completionHandler: @escaping (JSON?, Error?) -> Void) {
        fetchRequest(url: getStoresUrl, completionHandler: { requests, error in
            if let requests = requests {
                completionHandler(requests, nil)
            } else if let error = error {
                completionHandler(nil, error)
            }
        })
    }
    
    func postSearch(search: String, _ completionHandler: @escaping (JSON?, Error?) -> Void) {
        fetchRequest(
            url: postSearchUrl,
            completionHandler: { requests, error in
                if let requests = requests {
                    completionHandler(requests, nil)
                } else if let error = error {
                    completionHandler(nil, error)
                }
            },
            httpMethod: "POST",
            body: search.data(using: String.Encoding.utf8)
        )
    }
    
    func postBuyUrl(products: Array<ProductInfo>, _ completionHandler: @escaping (JSON?, Error?) -> Void) {
        do{
            let jsonData = try JSONEncoder().encode(products)
            fetchRequest(
                url: postBuyUrl,
                completionHandler: { requests, error in
                    if let requests = requests {
                        completionHandler(requests, nil)
                    } else if let error = error {
                        completionHandler(nil, error)
                    }
                },
                httpMethod: "POST",
                body: jsonData
            )
        } catch {
            print("error")
        }
        
    }
}
