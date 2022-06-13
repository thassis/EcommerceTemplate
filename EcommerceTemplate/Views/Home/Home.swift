//
//  Main.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 23/02/22.
//

import SwiftUI

struct Home: View {
    @ObservedObject var productsViewModel: ProductsViewModel
    
    init(){
        productsViewModel = ProductsViewModel()
        productsViewModel.getNewProducts()
    }
    
    var productsList: Array<ProductInfo> {
        productsViewModel.products.list
    }
    
    var body: some View {
        VStack(spacing: 0){
            Header(title: "Groceries")
            SearchBar()
                .padding(.bottom, 16)
                .background(Color("Primary"))
            
            ScrollView() {
                VStack(spacing: 0) {
                    CategoriesList()
                        .padding()
                    
                    ProductsList(productsList)
                        .padding(16)
                    ProductsList(productsList)
                        .padding(16)
                    
                    StoreList().padding(.top, 16)
                }
            }.background(Color("background"))
            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
