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
        productsViewModel.getPopularProducts()
    }
    
    var newProductsList: Array<ProductInfo> {
        productsViewModel.newProducts.list
    }
    
    var popularProductsList: Array<ProductInfo> {
        productsViewModel.popularProducts.list
    }
    
    var body: some View {
        VStack(spacing: 0){
            Header<SignUp>(title: "Groceries", goBackTo: SignUp())
            SearchBar()
                .padding(.bottom, 16)
                .background(Color("Primary"))
            
            ScrollView() {
                VStack(spacing: 0) {
                    CategoriesList()
                        .padding()
                    
                    ProductsList(newProductsList)
                        .padding(16)
                    ProductsList(popularProductsList)
                        .padding(16)
                    
                    StoreList().padding(.top, 16)
                }
            }.background(Color("background"))
            Spacer()
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
