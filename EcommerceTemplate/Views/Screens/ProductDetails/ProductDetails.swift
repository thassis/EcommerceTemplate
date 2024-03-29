//
//  ProductDetails.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 22/06/22.
//

import SwiftUI

struct ProductDetails: View {
    var id: Int
    var name: String
    @ObservedObject var productsViewModel: ProductsViewModel
    @EnvironmentObject var cart: ProductsCartViewModel
    @State private var isLoading = true
    @State private var goToCart: Int? = 0
    
    init(id: Int, name: String){
        self.id = id
        self.name = name
        self.productsViewModel = ProductsViewModel()
    }
    
    var productDetail: ProductInfo {
        self.productsViewModel.productDetail ?? ProductInfo(
            productId: 0,
            name: "",
            price: 0,
            discountPrice: 0,
            description: "",
            imageURL: ""
        )
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            NavigationLink(destination: Cart(), tag: 1, selection: $goToCart) {
                EmptyView()
            }
            VStack(alignment: .leading, spacing: 0){
                Header(title: "", showGoBack: true)
                if(isLoading){
                    ProgressView()
                        .frame(width: UIScreen.screenWidth, height: 226)
                } else {
                    AsyncImage(url: URL(string: productDetail.imageURL)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth * 3/4)
                    } placeholder: {
                        ProgressView()
                            .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth * 3/4)
                    }
                    .padding(.top, 8)
                }
                
                
                TextStyle(
                    self.name,
                    type: .medium,
                    bold: true,
                    textColor: Color("Black")
                ).padding()
                
                if(isLoading){
                    EmptyView()
                        .padding(.horizontal)
                } else {
                    HStack(alignment: .top, spacing: 0){
                        TextStyle("$ \(productDetail.price)", type: .small, bold: true, textColor: Color("Primary"))
                    }
                    .padding(.horizontal)
                }
                Spacer()
            }
            Color("background").frame(height: 8)
            ZStack(alignment: .bottom){
                VStack{
                    if(isLoading){
                        Spacer()
                        ProgressView().padding()
                    } else {
                        ScrollView {
                            
                            TextStyle(
                                productDetail.description,
                                type: .medium,
                                textColor: Color("Black")
                            )
                            .padding()
                        }
                    }
                    Spacer()
                }
                
                HStack{
                    if(!isLoading){
                        FilledButton("Add To Cart", onPress: {
                            print("added to cart")
                            cart.addProductToCart(productDetail)
                            self.goToCart = 1
                        })
                        .padding(.top)
                    }
                }
                .background(Color.white)
                .shadow(color: .black, radius: 1/3)
                
            }
            
        }
        .onAppear {
            print("on apperar pdp")
            return self.productsViewModel.getProductDetails(id: self.id)
        }
        .onReceive(self.productsViewModel.$productDetail) { productDetail in
            print("on onReceive pdp")
            return self.isLoading = productDetail == nil
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(id: 1, name: "teste")
    }
}
