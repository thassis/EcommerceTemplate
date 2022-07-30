//
//  SwiftUIView.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 25/02/22.
//

import SwiftUI

struct TabViews: View {
    @StateObject var cart = ProductsCartViewModel()
    
    var body: some View {
        NavigationView{
            TabView {
                Home()
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                Text("Browse")
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Browse")
                    }
                Text("Store")
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    .tabItem {
                        Image(systemName: "bag.fill")
                        Text("Store")
                    }
                Text("History")
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    .tabItem {
                        Image(systemName: "list.bullet.rectangle.portrait.fill")
                        Text("Order History")
                    }
                Text("Profile")
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
            }
            .accentColor(Color("Primary"))
        }
        .navigationViewStyle(.stack)
        .environmentObject(cart)
    }
}

struct TabViews_Previews: PreviewProvider {
    static var previews: some View {
        TabViews()
    }
}
