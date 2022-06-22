//
//  CategoriesList.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 25/02/22.
//

import SwiftUI

struct CategoriesList: View {
    private let categories = ["beverages", "breads", "eggs", "frozen", "fruit", "homecare", "petcare", "vegs"]
    
    private var fourColumnGrid = [GridItem(.flexible(), spacing: 1), GridItem(.flexible(), spacing: 1), GridItem(.flexible(), spacing: 1), GridItem(.flexible(), spacing: 1)]

    let widthScreen = UIScreen.main.bounds.size.width
        
    var body: some View {
        LazyVGrid(columns: fourColumnGrid, spacing: 1) {
            ForEach(categories.indices, id: \.self) {index in
                Category(name: self.categories[index])
            }
        }
    }
}

struct Category: View {
    let name: String
    var body: some View{
        ZStack{
            Image(name)
                .resizable()
                .aspectRatio(1, contentMode: .fit)
            TextStyle(name, type: .small)
        }
    }
}

struct CategoriesList_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesList()
.previewInterfaceOrientation(.portrait)
    }
}
