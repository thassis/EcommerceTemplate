//
//  Services.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 21/06/22.
//

import Foundation
import SwiftyJSON

struct Services {
//    private let apiManager = new ApiManager()
    func getNewProducts(_ completionHandler: @escaping (JSON?, Error?) -> Void) {
        //Change the url according to given params before call GET Request
        ApiManager.fetchRequest(url: ApiManager.getProductsUrl, completionHandler: { requests, error in
            if let requests = requests {
                completionHandler(requests, nil)
            } else if let error = error {
                completionHandler(nil, error)
            }
        })
    }
    
    func getNewCategories(_ completionHandler: @escaping (JSON?, Error?) -> Void) {
        ApiManager.fetchRequest(url: ApiManager.getNewCategoriesUrl, completionHandler: { requests, error in
            if let requests = requests {
                completionHandler(requests, nil)
            } else if let error = error {
                completionHandler(nil, error)
            }
        })
    }
    
    func getPopularProducts(_ completionHandler: @escaping (JSON?, Error?) -> Void) {
        ApiManager.fetchRequest(url: ApiManager.getPopularProductsUrl, completionHandler: { requests, error in
            if let requests = requests {
                completionHandler(requests, nil)
            } else if let error = error {
                completionHandler(nil, error)
            }
        })
    }
    
    func getStores(_ completionHandler: @escaping (JSON?, Error?) -> Void) {
        ApiManager.fetchRequest(url: ApiManager.getStoresUrl, completionHandler: { requests, error in
            if let requests = requests {
                completionHandler(requests, nil)
            } else if let error = error {
                completionHandler(nil, error)
            }
        })
    }
    
    func postSearch(search: String, _ completionHandler: @escaping (JSON?, Error?) -> Void) {
        ApiManager.fetchRequest(
            url: ApiManager.postSearchUrl,
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
            ApiManager.fetchRequest(
                url: ApiManager.postBuyUrl,
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
