//
//  ApiManager.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 26/04/22.
//

import Foundation
import SwiftyJSON

enum BaseUrls: String {
    case v1 = "https://apisconstants.herokuapp.com/"
    case v2 = "https://apisconstants.herokuapp.com/v2/"
}

struct ApiManager {
    
    private let getProductsUrl = BaseUrls.v1.rawValue
    //    private let getUserUrl = BaseUrls.v1.rawValue + "getUserInfo/"
    
    func getRequest(url: String, completionHandler: @escaping (JSON?, Error?) -> Void, header: String = "application/json", forHTTPHeaderField: String = "Content-Type") {
        let url = URL(string: url)!
        
        var request = URLRequest(url: url)
        
        request.setValue(header, forHTTPHeaderField: forHTTPHeaderField)
        
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
        getRequest(url: getProductsUrl, completionHandler: { requests, error in
            if let requests = requests {
                completionHandler(requests, nil)
            } else if let error = error {
                completionHandler(nil, error)
            }
        })
    }
}
