//
//  ProductsList.swift
//  EcommerceTemplate
//
//  Created by Thiago Assis on 28/02/22.
//

import SwiftUI

struct ProductsList: View {
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                TextMedium("New Product", bold: true, textColor: Color("Black"))
                Spacer()
                TextSmall("See All", bold: true)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 4)
                    .background(
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundColor(Color("Primary"))
                    )
            }
            ScrollView(.horizontal){
                HStack(spacing: 10) {
                    CardProduct()
                    CardProduct()
                    CardProduct()
                    CardProduct()
                    CardProduct()
                }
            }
        }
    }
}

struct ProductsList_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color("background")
            ProductsList()
        }
    }
}
