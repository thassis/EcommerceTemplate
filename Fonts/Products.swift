//
//  NewProducts.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 01/03/22.
//

import Foundation

struct Products {
    private(set) var list: Array<ProductInfo>
    
    init(_ list: Array<ProductInfo>){
        self.list = list;
    }
}

