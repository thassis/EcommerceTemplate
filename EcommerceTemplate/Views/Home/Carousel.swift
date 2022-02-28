//
//  Carousel.swift
//  EcommerceTemplate
//
//  Created by Guilherme Assis on 25/02/22.
//

import SwiftUI
import ACarousel

struct Item: Identifiable {
    let id = UUID()
    let image: Image
}

let roles = ["beverages", "breads", "eggs", "frozen", "fruit", "homecare", "petcare", "vegs"]

struct Carousel: View {
    
    let items: [Item] = roles.map { Item(image: Image($0)) }
    
    var body: some View {
        ACarousel(items, autoScroll: .active(5)) { item in
            item.image
                .resizable()
                .scaledToFill()
                .frame(height: 165)
                .cornerRadius(8)
        }
        .frame(height: 192)
    }
}


struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        Carousel()
    }
}
