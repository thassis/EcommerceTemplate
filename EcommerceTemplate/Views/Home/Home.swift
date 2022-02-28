//
//  Main.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 23/02/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(spacing: 0){
            Header(title: "Groceries")
            SearchBar()
                .padding(.bottom, 16)
                .background(Color("Primary"))
            
            ScrollView {
                Carousel()
                CategoriesList()
            }.background(Color("Background"))
            
            Spacer()
        }   
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
