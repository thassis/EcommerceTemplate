//
//  SwiftUIView.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 25/02/22.
//

import SwiftUI

struct TabViews: View {
    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            Text("Browse")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Browse")
                }
            Text("Store")
                .tabItem {
                    Image(systemName: "bag.fill")
                    Text("Store")
                }
            Text("History")
                .tabItem {
                    Image(systemName: "list.bullet.rectangle.portrait.fill")
                    Text("Order History")
                }
            Text("Profile")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .accentColor(Color("Primary"))
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct TabViews_Previews: PreviewProvider {
    static var previews: some View {
        TabViews()
    }
}
