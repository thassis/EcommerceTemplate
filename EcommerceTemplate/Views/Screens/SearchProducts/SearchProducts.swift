//
//  SearchProducts.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 24/06/22.
//

import SwiftUI

struct SearchProducts: View {
    private var search: String
    @ObservedObject var searchViewModel: SearchViewModel
    
    var productsList: Array<ProductInfo> {
        searchViewModel.searchProducts.list
    }
    
    var isLoading: Bool {
        searchViewModel.isLoading
    }
    
    var notFoundProducts: Bool {
        !isLoading && productsList.count == 0
    }
    
    init(_ search: String){
        self.search = search
        searchViewModel = SearchViewModel()
    }
    
    let columns = [
        GridItem(),
        GridItem(),
    ]
    
    var body: some View {
        VStack{
            Header(title: search, showGoBack: true)
            Spacer()
            ScrollView {
                if(isLoading){
                    ProgressView()
                } else {
                    if(notFoundProducts){
                        TextStyle(
                            "Products not found! Please, try another search",
                            type: .medium,
                            textColor: Color("Black")
                        )
                        .multilineTextAlignment(.center)
                    } else {
                        LazyVGrid(columns: columns) {
                            ForEach(productsList) { product in
                                NavigationLink(
                                    destination: ProductDetails(
                                        id: product.productId,
                                        name: product.name
                                    )
                                ) {
                                    CardProduct(product)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.top)
        }
        .onAppear {
            print("searching...")
            searchViewModel.search(search)
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct SearchProducts_Previews: PreviewProvider {
    static var previews: some View {
        SearchProducts("breads")
    }
}
